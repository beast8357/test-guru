# frozen_string_literal: true

class BadgeDistributionService

  BADGE_PARAMS = {
    user_passed_their_first_test:
      { name: "First Test",
        image_name: "first_test.png",
        criterion: "Pass your first test",
        description: "This badge is given to you once you pass your first test" },
  }.freeze

  ACHIEVEMENTS = {
    user_passed_their_first_test: ->(context) do
      if context.user.test_passages.one?
        context.user.test_passages.last.completed?
      else
        false
      end
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
