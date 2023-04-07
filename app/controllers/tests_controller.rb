class TestsController < ApplicationController

  before_action :set_test, only: %i[ start show ]
  before_action :set_user, only: :start

  def index
    @tests = Test.all
  end

  def show
    @test_questions = @test.questions.pluck(:body)
  end

  def edit
    
  end

  def start
    @user.tests.push(@test)

    redirect_to test_passage_path(@user.test_passage(@test))
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end

end
