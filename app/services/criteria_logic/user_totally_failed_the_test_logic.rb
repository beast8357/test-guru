# frozen_string_literal: true

class UserTotallyFailedTheTestLogic
  class << self
    def suitable?(context)
      context.test_passage.correct_questions == 0 ? true : false
    end
  end
end
