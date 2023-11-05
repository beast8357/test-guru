# frozen_string_literal: true

module Badges
  module CriteriaLogic
    class UserSuccessfullyPassedAllTestsOfCertainCategoryLogic
      class << self
        def suitable?(user_test_passages, category_id, relevant_tests)
          box = []
          user_test_passages.each do |t_p|
            if test = relevant_tests.find_by_id(t_p.test_id)
              box << t_p if t_p.successful? && test.category_id == category_id && !box.include?(t_p)
            end
          end

          box.size == relevant_tests.size
        end
      end
    end
  end
end
