class GistsController < ApplicationController
  before_action :set_test_passage, only: :create

  def create
    gist = GistQuestionService.new(@test_passage.current_question)
    result = gist.call

    if gist.success?
      current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
      flash[:notice] = t('.success', url: result.html_url)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to test_passage_path(@test_passage)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.last
  end
end
