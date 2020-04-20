class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update gist]
  
  def index
    @test_passages = current_user.test_passages
  end
  
  def show
    @answer = 
      if @test_passage.current_question.answers.blank?
        @test_passage.current_question.answers.new
      else
        @test_passage.current_question.answers.last
      end
  end
  
  def update
    @test_passage.accept!(test_passage_params[:answer][:ids]) if test_passage_params[:answer].present?
    
    if @test_passage.current_question.last?
      check_for_badges
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to tests_path
    else
      @test_passage.set_next_question!
      redirect_to test_passage_path(@test_passage)
    end
  end
  
  def check_for_badges
    Badge.all.each do |badge|
      badge_checker = current_user.badge_checkers.where(badge_id: badge.id).first_or_create
      badge_checker.test_passages << @test_passage
      
      if badge_checker.test_passages.send(badge.method, eval("#{badge.args}"))  && badge_checker.test_passages.all_success?
        current_user.badges << badge
        badge_checker.test_passages = []
      end
    end
  end
  
  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    response = service.call
    if service.success?
      gist_url = "https://gist.github.com/#{response.owner.login}/#{response.id}"
      gist = current_user.gists.find_or_create_by(url: gist_url, question_id: @test_passage.current_question.id)
      flash_options = { notice: t('.success', gist_url: gist.url) }
    else
      flash_options = { notice: t('.failure') }
    end
    
    
    redirect_to test_passage_path(id: @test_passage.id), flash_options
  end
  
  private
  
  def test_passage_params
    params.permit(:answer => {:ids => []})
  end
  
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
