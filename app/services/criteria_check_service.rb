# frozen_string_literal: true

folder_path = File.expand_path('criteria_logic', __dir__)
ruby_files = Dir[File.join(folder_path, '*.rb')]
ruby_files.each { |file| require_relative File.join('criteria_logic', File.basename(file, '.rb')) }

class CriteriaCheckService
  CRITERIA_CHECK = {
    user_passed_their_first_test: ->(context) do
      UserPassedTheirFirstTestLogic.suitable?(context)
    end,
    user_passed_the_test_flawlessly: ->(context) do
      UserPassedTheTestFlawlesslyLogic.suitable?(context)
    end,
    user_totally_failed_the_test: ->(context) do
      UserTotallyFailedTheTestLogic.suitable?(context)
    end,
    user_passed_the_test_flawlessly_on_the_first_attempt: ->(context) do
      UserPassedTheTestFlawlesslyOnTheFirstAttempLogic.suitable?(context, CRITERIA_CHECK)
    end,
    user_successfully_passed_all_tests_on_programming: ->(context) do
      UserSuccessfullyPassedAllTestsOnCertainCategoryLogic.suitable?(context, "Programming")
    end,
    user_successfully_passed_all_tests_on_music_mixing: ->(context) do
      UserSuccessfullyPassedAllTestsOnCertainCategoryLogic.suitable?(context, "Music Mixing")
    end,
    user_successfully_passed_all_tests_on_gaming: ->(context) do
      UserSuccessfullyPassedAllTestsOnCertainCategoryLogic.suitable?(context, "Gaming")
    end,
    user_successfully_passed_all_tests_lvl_easy: ->(context) do
      UserSuccessfullyPassedAllTestsOnLevelEasyLogic.suitable?(context)
    end,
    user_successfully_passed_all_tests_lvl_medium: ->(context) do
      UserSuccessfullyPassedAllTestsOnLevelMediumLogic.suitable?(context)
    end,
    user_successfully_passed_all_tests_lvl_hard: ->(context) do
      UserSuccessfullyPassedAllTestsOnLevelHardLogic.suitable?(context)
    end,
  }.freeze
end
