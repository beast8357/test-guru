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

end
