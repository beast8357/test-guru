# frozen_string_literal: true

class UserSuccessfullyPassedAllTestsOnLevelMediumLogic

  def yes?(context)
    return if UserBadgeCheckService.new.user_has_badge_with_name?(
        context,
        context.badge_params.fetch(:user_successfully_passed_all_tests_lvl_medium).fetch(:name)
      )
    TestsSuccessCheckService.new.tests_successful?(context.test_passage,
                                                   context.user.tests.medium,
                                                   Test.medium.ready)
  end

end
