class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index show]
  before_action :find_question, only: %i[show]

  def index
    test_questions = @test.questions.pluck(:body)
    render plain: "Test#{@test.id} questions:\n#{test_questions.join("\n")}"
  end

  def show
    render plain: "Question body:\n#{@question.body}"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

end
