class FeedbacksController < ApplicationController

  def new
    @feedback = current_user.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end

end
