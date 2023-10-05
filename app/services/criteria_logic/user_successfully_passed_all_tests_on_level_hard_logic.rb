# frozen_string_literal: true

class UserSuccessfullyPassedAllTestsOnLevelHardLogic

  def yes?(context)
    return if UserBadgeCheckService.new.user_has_badge_with_name?(
        context,
        context.badge_params.fetch(:user_successfully_passed_all_tests_lvl_hard).fetch(:name)
      )
    TestsSuccessCheckService.new.tests_successful?(context.test_passage,
                                                   context.user.tests.hard,
                                                   Test.hard.ready)
  end

end
