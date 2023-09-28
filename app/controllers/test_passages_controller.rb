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
      BadgeDistributionService.new(@test_passage).give_badges
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
