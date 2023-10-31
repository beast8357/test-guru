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
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOnCertainCategoryLogic.suitable?(context, "Programming")
        end,
        user_successfully_passed_all_tests_on_music_mixing: ->(context) do
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOnCertainCategoryLogic.suitable?(context, "Music Mixing")
        end,
        user_successfully_passed_all_tests_on_gaming: ->(context) do
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOnCertainCategoryLogic.suitable?(context, "Gaming")
        end,
        user_successfully_passed_all_tests_lvl_easy: ->(context) do
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOnLevelEasyLogic.suitable?(context)
        end,
        user_successfully_passed_all_tests_lvl_medium: ->(context) do
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOnLevelMediumLogic.suitable?(context)
        end,
        user_successfully_passed_all_tests_lvl_hard: ->(context) do
          Badges::CriteriaLogic::UserSuccessfullyPassedAllTestsOnLevelHardLogic.suitable?(context)
        end,
      }.freeze
    end
  end
end
