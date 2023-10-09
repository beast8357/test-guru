# frozen_string_literal: true

class UserPassedTheirFirstTestLogic
  def yes?(context)
    if context.user.test_passages.one?
      context.user.test_passages.last.completed?
    else
      false
    end
  end
end
