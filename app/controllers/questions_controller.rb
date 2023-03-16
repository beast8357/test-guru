class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index show create destroy]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @test_questions = @test.questions.pluck(:body)
  end

  def show
    
  end

  def new
    
  end

  def create
    @test.questions.create(question_params)

    redirect_to test_questions_path(@test)
  end

  def destroy
    @question.destroy

    redirect_to test_questions_path(@test)
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
