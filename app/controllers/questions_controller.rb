class QuestionsController < ApplicationController

  before_action :find_test, only: %i[ index show new edit create update destroy ]
  before_action :find_question, only: %i[ show edit update destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @test_questions = @test.questions.pluck(:body)
  end

  def show
    
  end

  def new
    @question = @test.questions.new
  end

  def edit
    
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to @test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end

end
