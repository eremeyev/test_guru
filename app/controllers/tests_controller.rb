class TestsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @tests = Test.all #current_user.tests
  end

  def start
    @test = Test.find(params[:id])
    test_passage = TestPassage.find_or_create_by(test_id: @test.id, user_id: current_user.id)
    test_passage.prepare_start!
    redirect_to current_user.test_passage(@test)
  end
end
