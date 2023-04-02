class AnswersController < ApplicationController

  before_action :find_test, only: %i[ show new edit create update destroy ]
  before_action :find_question, only: %i[ show new edit create update destroy ]
  before_action :set_answer, only: %i[ show edit update destroy ]

  def show

  end

  def new
    @answer = @question.answers.new
  end

  def edit

  end
  
  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to test_question_path(@test, @answer.question)
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to test_question_path(@test, @answer.question)
    else
      render :new
    end
  end

  def destroy
    @answer.destroy

    redirect_to test_question_path(@test, @answer.question)
  end

  private

    def find_test
      @test = Test.find(params[:test_id])
    end

    def find_question
      @question = @test.questions.find(params[:question_id])
    end

    def set_answer
      @answer = @question.answers.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:body, :correct)
    end
end
