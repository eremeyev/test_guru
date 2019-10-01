class TestsController < ApplicationController
  before_action :set_test, only: %i[show update edit start destroy]
  before_action :set_tests, only: %i[index]
  before_action :set_questions, only: %i[show update]
  before_action :set_user, only: %i[start]
  
  def index
  end

  def new
    @test = Test.new
  end
  
  def create
    @test = Test.new(test_params)
    @test.author = @current_user
    if @test.save
      flash[:notice] = "Created successfuly!"
      redirect_to tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      flash[:notice] = "Updated successfuly!"
      redirect_to tests_path
    else
      render :edit
    end
  end
  
  def edit
  end
  
  def destroy
    @test.destroy
    flash[:notice] = "Test deleted"
    redirect_to tests_path
  end
  
  def start
    TestPassage.find_or_create_by(test_id: @test.id, user_id: @user.id)
    redirect_to @user.test_passage(@test)
  end

  private
  
  def set_test
    @test = Test.find(params[:id])
  end
  
  def set_tests
    @tests = Test.all
  end
  
  def set_questions
    @questions = @test.questions
  end

  def set_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
