class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show update edit start destroy]
  before_action :set_tests, only: %i[index]
  before_action :set_questions, only: %i[show update]
  layout 'admin'
  
  def index
  end

  def new
    @test = Test.new
  end
  
  def create
    @test = current_user.my_tests.new(test_params)
    if @test.save
      flash[:notice] = "Created successfuly!"
      redirect_to admin_tests_path
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
