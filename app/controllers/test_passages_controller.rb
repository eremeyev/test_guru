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
  
  def result
    
  end
  
  def update
    @test_passage.accept!(test_passage_params[:answer][:ids]) if test_passage_params[:answer].present?
    
    if @test_passage.current_question.last?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to tests_path
    else
      @test_passage.set_next_question!
      redirect_to test_passage_path(@test_passage)
    end
  end
  
  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.created_at.present?
#    if true
      gist_url = "https://gist.github.com/#{result.owner.login}/#{result.id}"
#      gist_url = "https://gist.github.com/azazelo/id"
      gist = current_user.gists.find_or_create_by(url: gist_url)
      gist.update(question_id: @test_passage.current_question.id)
      flash_options = { notice: t('.success', gist_url: "https://gist.github.com/#{result.owner.login}/#{result.id}") }
#      flash_options = { notice: t('.success') }
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
