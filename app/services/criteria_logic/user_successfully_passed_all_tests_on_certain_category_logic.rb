# frozen_string_literal: true

class UserSuccessfullyPassedAllTestsOnCertainCategoryLogic
  class << self
    def suitable?(context, category)
      return if UserBadgeCheckService.new.user_has_badge_with_name?(
          context,
          BadgeParamsService::BADGE_PARAMS.fetch(:user_successfully_passed_all_tests_on_programming).fetch(:name)
        )
      TestsSuccessCheckService.new.tests_successful?(context.test_passage,
                                                     context.user.tests.by_category(category),
                                                     Test.by_category(category).ready)
    end
  end
end
