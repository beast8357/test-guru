# frozen_string_literal: true

class BadgeDistributionService

  BADGE_PARAMS = {
    user_passed_their_first_test:
      { name: "First Test",
        image_name: "first_test.png",
        description: "This badge is given to you once you pass your first test" },
    user_passed_the_test_flawlessly:
      { name: "Flawless Test",
        image_name: "flawless_test.png",
        description: "You answered all the test questions correctly" },
    user_totally_failed_the_test:
      { name: "Epic Fail",
        image_name: "epic_fail.png",
        description: "You answered all the test questions incorrectly" },
    user_passed_the_test_flawlessly_on_the_first_attempt:
      { name: "Amazing First Attempt",
        image_name: "amazing_first_attempt.png",
        description: "You have successfully passed the test on the first attempt" },
    user_successfully_passed_all_tests_on_programming:
      { name: "Programming Guru",
        image_name: "programming_guru.png",
        description: "You have successfully passed all the tests from the 'Programming' category" },
    user_successfully_passed_all_tests_on_music_mixing:
      { name: "Music Mixing Guru",
        image_name: "music_mixing_guru.png",
        description: "You have successfully passed all the tests from the 'Music Mixing' category" },
    user_successfully_passed_all_tests_on_gaming:
      { name: "Gaming Guru",
        image_name: "gaming_guru.png",
        description: "You have successfully passed all the tests from the 'Gaming' category" },
    user_successfully_passed_all_tests_lvl_easy:
      { name: "Easy Peasy",
        image_name: "easy_peasy.png",
        description: "You have successfully passed all the tests with level 'Easy'" },
    user_successfully_passed_all_tests_lvl_medium:
      { name: "Medium Rare",
        image_name: "medium_rare.png",
        description: "You have successfully passed all the tests with level 'Medium'" },
    user_successfully_passed_all_tests_lvl_hard:
      { name: "Die Hard",
        image_name: "die_hard.png",
        description: "You have successfully passed all the tests with level 'Hard'" },
  }.freeze

  ACHIEVEMENTS = {
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
      if ACHIEVEMENTS.fetch(:user_passed_the_test_flawlessly).call(context) == true
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
          BADGE_PARAMS.fetch(:user_successfully_passed_all_tests_on_programming).fetch(:name)
        )
      category = Category.find_by_title("Programming").title
      successfully_passed_all?(context.test_passage,
                               context.user.tests.by_category(category),
                               Test.by_category(category).ready)
    end,
    user_successfully_passed_all_tests_on_music_mixing: ->(context) do
      return if user_has_badge_with_name?(
          context,
          BADGE_PARAMS.fetch(:user_successfully_passed_all_tests_on_music_mixing).fetch(:name)
        )
      category = Category.find_by_title("Music Mixing").title
      successfully_passed_all?(context.test_passage,
                               context.user.tests.by_category(category),
                               Test.by_category(category).ready)
    end,
    user_successfully_passed_all_tests_on_gaming: ->(context) do
      return if user_has_badge_with_name?(
          context,
          BADGE_PARAMS.fetch(:user_successfully_passed_all_tests_on_gaming).fetch(:name)
        )
      category = Category.find_by_title("Gaming").title
      successfully_passed_all?(context.test_passage,
                               context.user.tests.by_category(category),
                               Test.by_category(category).ready)
    end,
    user_successfully_passed_all_tests_lvl_easy: ->(context) do
      return if user_has_badge_with_name?(
          context,
          BADGE_PARAMS.fetch(:user_successfully_passed_all_tests_lvl_easy).fetch(:name)
        )
      successfully_passed_all?(context.test_passage,
                               context.user.tests.easy,
                               Test.easy.ready)
    end,
    user_successfully_passed_all_tests_lvl_medium: ->(context) do
      return if user_has_badge_with_name?(
          context,
          BADGE_PARAMS.fetch(:user_successfully_passed_all_tests_lvl_medium).fetch(:name)
        )
      successfully_passed_all?(context.test_passage,
                               context.user.tests.medium,
                               Test.medium.ready)
    end,
    user_successfully_passed_all_tests_lvl_hard: ->(context) do
      return if user_has_badge_with_name?(
          context,
          BADGE_PARAMS.fetch(:user_successfully_passed_all_tests_lvl_hard).fetch(:name)
        )
      successfully_passed_all?(context.test_passage,
                               context.user.tests.hard,
                               Test.hard.ready)
    end,
  }.freeze

  attr_reader :test_passage, :user, :test, :badges

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badges = []
  end

  def give_badges
    self.check_achievements
    badges.each { |badge| user.badges << badge if badge.save! }
  end

  private

  def check_achievements
    ACHIEVEMENTS.keys.each do |key|
      if ACHIEVEMENTS.fetch(key).call(self) == true
        badges << Badge.new(BADGE_PARAMS.fetch(key))
      end
    end
  end

  class << self
    def successfully_passed_all?(test_passage, user_tests, reference_tests)
      box = []
      user_tests.each do |test|
        box << test if !box.include?(test) && test_passage.successful?
      end

      box == reference_tests ? true : false
    end

    def user_has_badge_with_name?(context, name)
      !context.user.badges.find_by_name(name).nil?
    end
  end

end
