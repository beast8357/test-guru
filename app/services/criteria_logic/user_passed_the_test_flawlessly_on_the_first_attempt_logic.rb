# frozen_string_literal: true

class UserPassedTheTestFlawlesslyOnTheFirstAttempLogic
  class << self
    def suitable?(context, hash)
      if hash.fetch(:user_passed_the_test_flawlessly).call(context) == true
        box = []
        context.user.tests.each { |test| box << test.id if test.id == context.test.id }
        box.one?
      else
        false
      end
    end
  end
end
