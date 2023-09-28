class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result]

  def show
    
  end

  def result
    
  end

  def update
    return redirect_to test_passage_path(@test_passage),
                       alert: t('.no_answer') unless params[:answer_ids]

    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      create_badge! if user_passed_their_first_test?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def user_passed_their_first_test?
    if current_user.test_passages.one?
      current_user.test_passages.last.completed?
    else
      false
    end
  end

  def create_badge!
    current_user.badges.create!(
        name: "First Test",
        image_name: "first_test.png",
        criterion: "Pass your first test",
        description: "This badge is given to you once you pass your first test"
      )
  end

end
