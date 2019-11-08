class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[start]
  before_action :set_tests, only: %i[index]
  
  def index
  end

  def start
    test_passage = TestPassage.find_or_create_by(test_id: @test.id, user_id: current_user.id)
    test_passage.prepare_start!
    redirect_to current_user.test_passage(@test)
  end

  private
  
  def set_test
    @test = Test.find(params[:id])
  end
  
  def set_tests
    @tests = Test.all #current_user.tests
  end
end
