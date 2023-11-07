# frozen_string_literal: true

module Badges
  module Constants
    class CriteriaCheck
      CRITERIA_CHECK = {
        user_passed_their_first_test: ->(context) do
          Badges::CriteriaLogic::UserPassedTheirFirstTestLogic.suitable?(context)
        end,
        user_passed_the_test_flawlessly: ->(context) do
          Badges::CriteriaLogic::UserPassedTheTestFlawlesslyLogic.suitable?(context)
        end,
        user_totally_failed_the_test: ->(context) do
          Badges::CriteriaLogic::UserTotallyFailedTheTestLogic.suitable?(context)
        end,
        user_passed_the_test_flawlessly_on_the_first_attempt: ->(context) do
          Badges::CriteriaLogic::UserPassedTheTestFlawlesslyOnTheFirstAttemptLogic.suitable?(context, CRITERIA_CHECK)
        end,
        user_successfully_passed_all_tests_on_programming: ->(context) do
          badge_name = Badges::BadgeName.call(:user_successfully_passed_all_tests_on_programming)
          return unless Badges::UserBadgeCheck.suitable?(context.user, badge_name)
          category_name = Category.find_by_id(1).title
          category_id = Category.find_by_title(category_name).id
          relevant_tests = Test.by_category(category_name).ready
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOfCertainCategoryLogic.suitable?(context.user.test_passages, category_id, relevant_tests)
        end,
        user_successfully_passed_all_tests_on_music_mixing: ->(context) do
          badge_name = Badges::BadgeName.call(:user_successfully_passed_all_tests_on_music_mixing)
          return unless Badges::UserBadgeCheck.suitable?(context.user, badge_name)
          category_name = Category.find_by_id(2).title
          category_id = Category.find_by_title(category_name).id
          relevant_tests = Test.by_category(category_name).ready
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOfCertainCategoryLogic.suitable?(context.user.test_passages, category_id, relevant_tests)
        end,
        user_successfully_passed_all_tests_on_gaming: ->(context) do
          badge_name = Badges::BadgeName.call(:user_successfully_passed_all_tests_on_gaming)
          return unless Badges::UserBadgeCheck.suitable?(context.user, badge_name)
          category_name = Category.find_by_id(3).title
          category_id = Category.find_by_title(category_name).id
          relevant_tests = Test.by_category(category_name).ready
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOfCertainCategoryLogic.suitable?(context.user.test_passages, category_id, relevant_tests)
        end,
        user_successfully_passed_all_tests_lvl_easy: ->(context) do
          badge_name = Badges::BadgeName.call(:user_successfully_passed_all_tests_lvl_easy)
          return unless Badges::UserBadgeCheck.suitable?(context.user, badge_name)
          level = 1
          relevant_tests = Test.easy.ready
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOfCertainLevelLogic.suitable?(context.user.test_passages, level, relevant_tests)
        end,
        user_successfully_passed_all_tests_lvl_medium: ->(context) do
          badge_name = Badges::BadgeName.call(:user_successfully_passed_all_tests_lvl_medium)
          return unless Badges::UserBadgeCheck.suitable?(context.user, badge_name)
          level = 2
          relevant_tests = Test.medium.ready
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOfCertainLevelLogic.suitable?(context.user.test_passages, level, relevant_tests)
        end,
        user_successfully_passed_all_tests_lvl_hard: ->(context) do
          badge_name = Badges::BadgeName.call(:user_successfully_passed_all_tests_lvl_hard)
          return unless Badges::UserBadgeCheck.suitable?(context.user, badge_name)
          level = 3
          relevant_tests = Test.hard.ready
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOfCertainLevelLogic.suitable?(context.user.test_passages, level, relevant_tests)
        end,
      }.freeze
    end
  end
end
