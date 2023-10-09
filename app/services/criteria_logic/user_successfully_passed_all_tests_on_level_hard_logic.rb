# frozen_string_literal: true

class UserSuccessfullyPassedAllTestsOnLevelHardLogic
  class << self
    def suitable?(context)
      return if UserBadgeCheckService.new.user_has_badge_with_name?(
          context,
          BadgeParamsService::BADGE_PARAMS.fetch(:user_successfully_passed_all_tests_lvl_hard).fetch(:name)
        )
      TestsSuccessCheckService.new.tests_successful?(context.test_passage,
                                                     context.user.tests.hard,
                                                     Test.hard.ready)
    end
  end
end
