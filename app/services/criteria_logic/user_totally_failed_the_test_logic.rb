# frozen_string_literal: true

class UserTotallyFailedTheTestLogic
  def yes?(context)
    context.test_passage.correct_questions == 0 ? true : false
  end
end
