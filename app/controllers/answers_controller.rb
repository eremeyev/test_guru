class AnswersController < ApplicationController
  before_action :set_question, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_answer, only: [:edit, :update, :destroy]
  
  def edit
  end
  
  def new
    @answer = @question.answers.new(user_id: @current_user.id)
  end

  def create
    @answer = @question.answers.new(answer_params(params))
    if @answer.save
      flash[:notice] = "Created."
      redirect_to question_path(@question)
    else 
      flash[:notice] = @answer.errors.full_messages.join(' ')
      render :action => :new
    end
  end
  
  def update
    if @answer.update(answer_params(params))
      flash[:notice] = "Updated."
      redirect_to question_path(@question)
    else
      flash[:notice] = @answer.errors.full_messages.join(' ')
      render :action => :edit
    end
      
  end
  
  def show
  end

  def  destroy
    if @answer.destroy
      flash[:notice] = "Deleted successfuly!"
      redirect_to edit_question_path(@question)
    else
      render inline: "Not Deleted." 
    end
  end

  private
  
  def answer_params(params)
    params.require(:answer).permit(:body, :correct, :user_id, :question_id)
  end
  
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end

