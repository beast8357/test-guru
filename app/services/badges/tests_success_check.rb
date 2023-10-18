# frozen_string_literal: true

module Badges
  class TestsSuccessCheck
    class << self
      def tests_successful?(test_passage, user_tests, reference_tests)
        box = []
        user_tests.each do |test|
          box << test if !box.include?(test) && test_passage.successful?
        end

        box == reference_tests
      end
    end
  end
end
