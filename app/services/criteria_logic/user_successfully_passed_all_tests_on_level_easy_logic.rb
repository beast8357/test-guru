# frozen_string_literal: true

class UserSuccessfullyPassedAllTestsOnLevelEasyLogic
  class << self
    def suitable?(context)
      return if UserBadgeCheckService.user_has_badge_with_name?(
          context,
          BadgeParamsService::BADGE_PARAMS.fetch(:user_successfully_passed_all_tests_lvl_easy).fetch(:name)
        )
      TestsSuccessCheckService.tests_successful?(context.test_passage,
                                                 context.user.tests.easy,
                                                 Test.easy.ready)
    end
  end
end
