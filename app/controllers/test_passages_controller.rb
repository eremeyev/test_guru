class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update]
  
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
  
  private
  
  def test_passage_params
    params.permit(:answer => {:ids => []})
  end
  
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
