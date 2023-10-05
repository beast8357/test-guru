# frozen_string_literal: true

class BadgeDistributionService

  CRITERIA_CHECK = {
    user_passed_their_first_test: ->(context) do
      if context.user.test_passages.one?
        context.user.test_passages.last.completed?
      else
        false
      end
    end,
    user_passed_the_test_flawlessly: ->(context) do
      context.test_passage.correct_answers_percentage == 100 ? true : false
    end,
    user_totally_failed_the_test: ->(context) do
      context.test_passage.correct_questions == 0 ? true : false
    end,
    user_passed_the_test_flawlessly_on_the_first_attempt: ->(context) do
      if CRITERIA_CHECK.fetch(:user_passed_the_test_flawlessly).call(context) == true
        box = []
        context.user.tests.each { |test| box << test.id if test.id == context.test.id }
        box.one?
      else
        false
      end
    end,
    user_successfully_passed_all_tests_on_programming: ->(context) do
      return if user_has_badge_with_name?(
          context,
          context.badge_params.fetch(:user_successfully_passed_all_tests_on_programming).fetch(:name)
        )
      category = Category.find_by_title("Programming").title
      TestsSuccessCheckService.new.tests_successful?(context.test_passage,
                                                     context.user.tests.by_category(category),
                                                     Test.by_category(category).ready)
    end,
    user_successfully_passed_all_tests_on_music_mixing: ->(context) do
      return if user_has_badge_with_name?(
          context,
          context.badge_params.fetch(:user_successfully_passed_all_tests_on_music_mixing).fetch(:name)
        )
      category = Category.find_by_title("Music Mixing").title
      TestsSuccessCheckService.new.tests_successful?(context.test_passage,
                                                     context.user.tests.by_category(category),
                                                     Test.by_category(category).ready)
    end,
    user_successfully_passed_all_tests_on_gaming: ->(context) do
      return if user_has_badge_with_name?(
          context,
          context.badge_params.fetch(:user_successfully_passed_all_tests_on_gaming).fetch(:name)
        )
      category = Category.find_by_title("Gaming").title
      TestsSuccessCheckService.new.tests_successful?(context.test_passage,
                                                     context.user.tests.by_category(category),
                                                     Test.by_category(category).ready)
    end,
    user_successfully_passed_all_tests_lvl_easy: ->(context) do
      return if user_has_badge_with_name?(
          context,
          context.badge_params.fetch(:user_successfully_passed_all_tests_lvl_easy).fetch(:name)
        )
      TestsSuccessCheckService.new.tests_successful?(context.test_passage,
                                                     context.user.tests.easy,
                                                     Test.easy.ready)
    end,
    user_successfully_passed_all_tests_lvl_medium: ->(context) do
      return if user_has_badge_with_name?(
          context,
          context.badge_params.fetch(:user_successfully_passed_all_tests_lvl_medium).fetch(:name)
        )
      TestsSuccessCheckService.new.tests_successful?(context.test_passage,
                                                     context.user.tests.medium,
                                                     Test.medium.ready)
    end,
    user_successfully_passed_all_tests_lvl_hard: ->(context) do
      return if user_has_badge_with_name?(
          context,
          context.badge_params.fetch(:user_successfully_passed_all_tests_lvl_hard).fetch(:name)
        )
      TestsSuccessCheckService.new.tests_successful?(context.test_passage,
                                                     context.user.tests.hard,
                                                     Test.hard.ready)
    end,
  }.freeze

  attr_reader :test_passage, :user, :test, :badge_params

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badge_params = BadgeParamsService::BADGE_PARAMS
  end

  def give_badges
    badge = nil
    CRITERIA_CHECK.keys.each do |criterion|
      if CRITERIA_CHECK.fetch(criterion).call(self) == true
        badge = Badge.new(badge_params.fetch(criterion))
        user.badges << badge if badge.save!
      end
    end
  end

  private

  class << self

    def user_has_badge_with_name?(context, name)
      !context.user.badges.find_by_name(name).nil?
    end
  end

end
