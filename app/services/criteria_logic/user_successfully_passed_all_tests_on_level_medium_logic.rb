# frozen_string_literal: true

class UserSuccessfullyPassedAllTestsOnLevelMediumLogic
  class << self
    def suitable?(context)
      return if UserBadgeCheckService.new.user_has_badge_with_name?(
          context,
          BadgeParamsService::BADGE_PARAMS.fetch(:user_successfully_passed_all_tests_lvl_medium).fetch(:name)
        )
      TestsSuccessCheckService.new.tests_successful?(context.test_passage,
                                                     context.user.tests.medium,
                                                     Test.medium.ready)
    end
  end
end
