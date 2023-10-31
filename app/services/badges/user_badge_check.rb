# frozen_string_literal: true

module Badges
  class UserBadgeCheck
    class << self
      def suitable?(context, name)
        !context.user.badges.find_by_name(name).nil?
      end
    end
  end
end
