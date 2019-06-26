class TestsController < ApplicationController
  before_action :set_test, only: %i[show update edit]
  before_action :set_tests
  before_action :set_questions, only: %i[show update]
  
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

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
