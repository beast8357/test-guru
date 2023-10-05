# frozen_string_literal: true

class UserPassedTheTestFlawlesslyLogic

  def yes?(context)
    context.test_passage.correct_answers_percentage == 100 ? true : false
  end

end
