# frozen_string_literal: true

class BadgeDistributionService
  attr_reader :test_passage, :user, :test

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def give_badges
    criteria = CriteriaCheckService::CRITERIA_CHECK.keys
    criteria.each do |criterion|
      if CriteriaCheckService::CRITERIA_CHECK.fetch(criterion).call(self)
        badge = Badge.new(BadgeParamsService::BADGE_PARAMS.fetch(criterion))
        user.badges << badge if badge.save!
      end
    end
  end
end
