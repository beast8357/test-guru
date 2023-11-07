# frozen_string_literal: true

module Badges
  module Constants
    class BadgeParams
      BADGE_PARAMS = {
        user_passed_their_first_test:
          { name: "First Test",
            image_name: "first_test.png",
            description: "You completed your first test" },
        user_passed_the_test_flawlessly:
          { name: "Flawless Test",
            image_name: "flawless_test.png",
            description: "You answered all the test questions correctly" },
        user_totally_failed_the_test:
          { name: "Epic Fail",
            image_name: "epic_fail.png",
            description: "You answered all the test questions incorrectly" },
        user_passed_the_test_flawlessly_on_the_first_attempt:
          { name: "Amazing First Attempt",
            image_name: "amazing_first_attempt.png",
            description: "You passed the test flawlessly on the first attempt" },
        user_successfully_passed_all_tests_on_programming:
          { name: "Programming Guru",
            image_name: "programming_guru.png",
            description: "You successfully passed all the tests from the 'Programming' category" },
        user_successfully_passed_all_tests_on_music_mixing:
          { name: "Music Mixing Guru",
            image_name: "music_mixing_guru.png",
            description: "You successfully passed all the tests from the 'Music Mixing' category" },
        user_successfully_passed_all_tests_on_gaming:
          { name: "Gaming Guru",
            image_name: "gaming_guru.png",
            description: "You successfully passed all the tests from the 'Gaming' category" },
        user_successfully_passed_all_tests_lvl_easy:
          { name: "Easy Peasy",
            image_name: "easy_peasy.png",
            description: "You successfully passed all the tests with level 'Easy'" },
        user_successfully_passed_all_tests_lvl_medium:
          { name: "Medium Rare",
            image_name: "medium_rare.png",
            description: "You successfully passed all the tests with level 'Medium'" },
        user_successfully_passed_all_tests_lvl_hard:
          { name: "Die Hard",
            image_name: "die_hard.png",
            description: "You successfully passed all the tests with level 'Hard'" },
      }.freeze
    end
  end
end
