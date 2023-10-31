# frozen_string_literal: true

module Badges
  class BadgesList
    class << self
      def call
        badge_params = Badges::Constants::BadgeParams::BADGE_PARAMS
        list = []
        badge_params.each do |criterion, params|
          list << Badge.find_by_name(params.fetch(:name))
        end

        return list
      end
    end
  end
end
