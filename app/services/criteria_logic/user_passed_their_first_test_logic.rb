# frozen_string_literal: true

class UserPassedTheirFirstTestLogic
  class << self
    def suitable?(context)
      if context.user.test_passages.one? && context.user.test_passages.last.completed?
        true
      else
        false
      end
    end
  end
end
