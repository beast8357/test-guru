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
        description: "You successfully passed the test on the first try" },
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
      passed_all?(context,
                  context.user.tests.by_category("Programming"),
                  Test.by_category("Programming"))
    end,
    user_successfully_passed_all_tests_on_music_mixing: ->(context) do
      passed_all?(context,
                  context.user.tests.by_category("Music Mixing"),
                  Test.by_category("Music Mixing"))
    end,
    user_successfully_passed_all_tests_on_gaming: ->(context) do
      passed_all?(context,
                  context.user.tests.by_category("Gaming"),
                  Test.by_category("Gaming"))
    end,
  }.freeze

  attr_reader :test_passage, :user, :badges

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
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

  def self.passed_all?(context, user_tests, reference_tests)
    box = []
    user_tests.each { |test| box << test unless box.include?(test) }
    box == reference_tests ? true : false
  end

end
