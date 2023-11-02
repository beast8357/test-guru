# frozen_string_literal: true

module Badges
  class IssuingBadges
    attr_reader :test_passage, :user, :test, :badges

    def initialize(test_passage)
      @test_passage = test_passage
      @user = test_passage.user
      @test = test_passage.test
      @badges = []
    end

    def call
      criteria = Badges::Constants::CriteriaCheck::CRITERIA_CHECK
      params = Badges::Constants::BadgeParams::BADGE_PARAMS
      collect_badges(criteria, params)
      return badges
    end

    private

    def collect_badges(criteria, params)
      criteria.keys.each do |criterion|
        if criteria.fetch(criterion).call(self)
          name = params.fetch(criterion).fetch(:name)
          badge = Badge.find_by_name(name)
          badges << badge
          user.badges << badge
        end
      end
    end
  end
end
