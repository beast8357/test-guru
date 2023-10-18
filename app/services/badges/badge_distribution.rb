# frozen_string_literal: true

module Badges
  class BadgeDistribution
    attr_reader :test_passage, :user, :test

    def initialize(test_passage)
      @test_passage = test_passage
      @user = test_passage.user
      @test = test_passage.test
    end

    def call
      criteria = Badges::Constants::CriteriaCheck::CRITERIA_CHECK
      params = Badges::Constants::BadgeParams::BADGE_PARAMS
      criteria.keys.each do |criterion|
        if criteria.fetch(criterion).call(self)
          badge = Badge.new(params.fetch(criterion))
          user.badges << badge if badge.save!
        end
      end
    end
  end
end
