class TestsController < ApplicationController

  before_action :set_test, only: %i[start show edit update destroy]
  before_action :test_params, only: %i[create update]

  def index
    @tests = Test.all
  end

  def show
    @test_questions = @test.questions.pluck(:body)
  end

  def new
    @test = Test.new
  end

  def edit
    
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      flash[:notice] = "New #{@test.title} test has been successfully created."
      redirect_to tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :new
    end
  end

  def destroy
    @test.destroy

    flash[:notice] = "The #{@test.title} test has been successfully deleted."
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)

    redirect_to test_passage_path(current_user.test_passage(@test))
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end
