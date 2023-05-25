class Admin::QuestionsController < Admin::BaseController

  helper_method :current_test

  before_action :find_question, only: %i[show edit update destroy]

  def show
    
  end

  def new
    @question = current_test.questions.new
  end

  def edit
    
  end

  def create
    @question = current_test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_path(current_test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(current_test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to admin_test_path(current_test)
  end

  private

  def current_test
    @current_test ||= Test.find(params[:test_id])
  end

  def find_question
    @question = current_test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

end
