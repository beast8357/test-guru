# frozen_string_literal: true

module Badges
  module CriteriaLogic
    class UserPassedTheTestFlawlesslyOnTheFirstAttemptLogic
      class << self
        def suitable?(context, hash)
          if hash.fetch(:user_passed_the_test_flawlessly).call(context)
            box = []
            context.user.tests.each { |test| box << test.id if test.id == context.test.id }
            box.one?
          else
            false
          end
        end
      end
    end
  end
end
