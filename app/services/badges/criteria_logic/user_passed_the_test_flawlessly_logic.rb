# frozen_string_literal: true

module Badges
  module CriteriaLogic
    class UserPassedTheTestFlawlesslyLogic
      class << self
        def suitable?(context)
          context.test_passage.correct_answers_percentage == HUNDRED
        end
      end

      private

      HUNDRED = 100
    end
  end
end
