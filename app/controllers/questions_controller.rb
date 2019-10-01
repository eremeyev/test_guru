class QuestionsController < ApplicationController
  before_action :set_test
  before_action :set_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end
  
  def show
  end
  
  def new
    @question = @test.questions.new
  end
  
  def create
    @question = @test.questions.new(question_params)
    if @question.save
      flash[:notice] = "Created successfuly!"
      redirect_to test_questions_path(test_id: @test.id)
    else
      render inline: "Not saved. Test: #{@test.title}</br>Question: #{@question.body}" 
    end
  end
  
  def  destroy
    if @question.destroy
      flash[:notice] = "Deleted successfuly!"
      redirect_to test_questions_path(test_id: @test.id)
    else
      render inline: "Not Deleted." 
    end
  end
  
  
  private
  
  def set_test
    @test = Test.find(params[:test_id])
  rescue 
    flash[:notice] = "Test not found. Redirected to last test's questions."
    redirect_to test_questions_path(test_id: Test.last.id)
  end
  
  def set_question
    @question = @test.questions.find(params[:id])
  end
  
  def question_params
    params.require(:question).permit(:body)
  end
  
  def rescue_with_question_not_found
    flash[:notice] = "Question not found"
    redirect_to test_questions_path(test_id: @test.id)
  end
end
