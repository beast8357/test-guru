class Admin::AnswersController < Admin::BaseController

  helper_method :current_test, :current_question

  before_action :set_answer, only: %i[show edit update destroy]

  def show

  end

  def new
    @answer = current_question.answers.new
  end

  def edit

  end
  
  def create
    @answer = current_question.answers.new(answer_params)

    if @answer.save
      redirect_to admin_test_question_path(current_test, current_question)
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_test_question_path(current_test, current_question)
    else
      render :new
    end
  end

  def destroy
    @answer.destroy

    redirect_to admin_test_question_path(current_test, current_question)
  end

  private

  def current_test
    @current_test ||= Test.find(params[:test_id])
  end

  def current_question
    @current_question ||= current_test.questions.find(params[:question_id])
  end

  def set_answer
    @answer = current_question.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

end
