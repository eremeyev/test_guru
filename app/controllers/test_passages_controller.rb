class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update]
  
  def index
    @test_passages = @current_user.test_passages
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
    @test_passage.answer_ids ||= []
    case params[:commit]
    when 'Previous'
      @test_passage.answer_ids -= params[:answer_ids].map(&:to_i)
      @test_passage.answer_ids += params[:checked_answer_ids].map(&:to_i) if params[:checked_answer_ids].present?
      @test_passage.answer_ids.uniq!
      @test_passage.current_question = @test_passage.previous_question
    when 'Next'
      @test_passage.answer_ids -= params[:answer_ids].map(&:to_i)
      @test_passage.answer_ids += params[:checked_answer_ids].map(&:to_i) if params[:checked_answer_ids].present?
      @test_passage.answer_ids.uniq!
      @test_passage.current_question = @test_passage.next_question
    when 'Finish'
      @test_passage.answer_ids -= params[:answer_ids].map(&:to_i)
      @test_passage.answer_ids += params[:checked_answer_ids].map(&:to_i) if params[:checked_answer_ids].present?
      @test_passage.answer_ids.uniq!
    end
    @test_passage.save
    if params[:commit] == 'Finish'
      redirect_to user_tests_path(user_id: @current_user.id)
    else
      redirect_to @test_passage
    end
  end
  
  private
  
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
