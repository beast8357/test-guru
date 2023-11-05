# frozen_string_literal: true

module Badges
  class UserBadgeCheck
    class << self
      def suitable?(user, badge_name)
        user.badges.find_by_name(badge_name).nil?
      end
    end
  end
end
