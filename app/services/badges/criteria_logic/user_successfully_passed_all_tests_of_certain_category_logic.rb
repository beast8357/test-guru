# frozen_string_literal: true

module Badges
  module CriteriaLogic
    class UserSuccessfullyPassedAllTestsOfCertainCategoryLogic
      def initialize(user_test_passages, category_id, relevant_tests)
        @box = []
        @test_ids = []
        @user_test_passages = user_test_passages
        @category_id = category_id
        @relevant_tests = relevant_tests
      end

      def suitable?
        user_test_passages.each do |t_p|
          test = relevant_tests.find_by_id(t_p.test_id)
          if test && test.category_id == category_id && t_p.successful? && !box.include?(t_p)
            test_ids << t_p.test_id
            box << t_p if test_ids.count(t_p.test_id) == ONE
          end
        end

        box.size == relevant_tests.size
      end

      private

      attr_reader :box, :test_ids, :user_test_passages, :category_id, :relevant_tests

      ONE = 1
    end
  end
end
