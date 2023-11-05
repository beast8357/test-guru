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
      collect_badges(criteria)
      return badges
    end

    private

    def collect_badges(criteria)
      criteria.keys.each do |criterion|
        if criteria.fetch(criterion).call(self)
          name = Badges::BadgeName.call(criterion)
          badge = Badge.find_by_name(name)
          badges << badge
          user.badges << badge
        end
      end
    end
  end
end
