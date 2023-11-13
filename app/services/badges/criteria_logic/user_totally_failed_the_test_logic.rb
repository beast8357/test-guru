# frozen_string_literal: true

module Badges
  module CriteriaLogic
    class UserTotallyFailedTheTestLogic
      class << self
        def suitable?(context)
          context.test_passage.correct_questions.zero?
        end
      end
    end
  end
end
