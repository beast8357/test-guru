# frozen_string_literal: true

class BadgeDistributionService
  attr_reader :test_passage, :user, :test, :badge_params, :criteria_check

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badge_params = BadgeParamsService::BADGE_PARAMS
    @criteria_check = CriteriaCheckService::CRITERIA_CHECK
  end

  def give_badges
    badge = nil
    criteria = criteria_check.keys
    criteria.each do |criterion|
      if criteria_check.fetch(criterion).call(self) == true
        badge = Badge.new(badge_params.fetch(criterion))
        user.badges << badge if badge.save!
      end
    end
  end
end
