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
      operate_badges(@test_passage)
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def operate_badges(test_passage)
    badges = Badges::IssuingBadges.new(test_passage).call
    flash[:notice] = new_badges_message(badges)
  end

  def new_badges_message(badges)
    unless badges.empty?
      Badges::FlashMessages::NewBadgesMessage.call(badges.count)
    end
  end
end
