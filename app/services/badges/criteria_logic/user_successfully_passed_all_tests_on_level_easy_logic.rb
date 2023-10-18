# frozen_string_literal: true

module Badges
  module CriteriaLogic
    class UserSuccessfullyPassedAllTestsOnLevelEasyLogic
      class << self
        def suitable?(context)
          params = Badges::Constants::BadgeParams::BADGE_PARAMS
          return if Badges::UserBadgeCheck.user_has_badge_with_name?(
              context,
              params.fetch(:user_successfully_passed_all_tests_lvl_easy).fetch(:name)
            )
          Badges::TestsSuccessCheck.tests_successful?(context.test_passage,
                                                      context.user.tests.easy,
                                                      Test.easy.ready)
        end
      end
    end
  end
end
