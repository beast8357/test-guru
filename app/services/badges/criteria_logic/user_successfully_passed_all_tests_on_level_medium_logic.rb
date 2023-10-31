# frozen_string_literal: true

module Badges
  module CriteriaLogic
    class UserSuccessfullyPassedAllTestsOnLevelMediumLogic
      class << self
        def suitable?(context)
          params = Badges::Constants::BadgeParams::BADGE_PARAMS
          return if Badges::UserBadgeCheck.suitable?(
              context,
              params.fetch(:user_successfully_passed_all_tests_lvl_medium).fetch(:name)
            )
          Badges::TestsSuccessCheck.suitable?(context.test_passage,
                                              context.user.tests.medium,
                                              Test.medium.ready)
        end
      end
    end
  end
end
