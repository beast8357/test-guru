# frozen_string_literal: true

module Badges
  module Constants
    class BadgesList
      class << self
        def call
          LIST
        end
      end

      private

      PARAMS = Badges::Constants::BadgeParams::BADGE_PARAMS

      LIST = [
        Badge.find_by_name(PARAMS.fetch(:user_passed_their_first_test).fetch(:name)),
        Badge.find_by_name(PARAMS.fetch(:user_passed_the_test_flawlessly).fetch(:name)),
        Badge.find_by_name(PARAMS.fetch(:user_totally_failed_the_test).fetch(:name)),
        Badge.find_by_name(PARAMS.fetch(:user_passed_the_test_flawlessly_on_the_first_attempt).fetch(:name)),
        Badge.find_by_name(PARAMS.fetch(:user_successfully_passed_all_tests_on_programming).fetch(:name)),
        Badge.find_by_name(PARAMS.fetch(:user_successfully_passed_all_tests_on_music_mixing).fetch(:name)),
        Badge.find_by_name(PARAMS.fetch(:user_successfully_passed_all_tests_on_gaming).fetch(:name)),
        Badge.find_by_name(PARAMS.fetch(:user_successfully_passed_all_tests_lvl_easy).fetch(:name)),
        Badge.find_by_name(PARAMS.fetch(:user_successfully_passed_all_tests_lvl_medium).fetch(:name)),
        Badge.find_by_name(PARAMS.fetch(:user_successfully_passed_all_tests_lvl_hard).fetch(:name)),
      ].freeze
    end
  end
end
