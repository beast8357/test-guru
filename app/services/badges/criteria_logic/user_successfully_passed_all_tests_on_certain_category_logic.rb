# frozen_string_literal: true

module Badges
  module CriteriaLogic
    class UserSuccessfullyPassedAllTestsOnCertainCategoryLogic
      class << self
        def suitable?(context, category)
          params = Badges::Constants::BadgeParams::BADGE_PARAMS
          return if Badges::UserBadgeCheck.suitable?(
              context,
              params.fetch(:user_successfully_passed_all_tests_on_programming).fetch(:name)
            )
          Badges::TestsSuccessCheck.suitable?(context.test_passage,
                                              context.user.tests.by_category(category),
                                              Test.by_category(category).ready)
        end
      end
    end
  end
end
