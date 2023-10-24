# frozen_string_literal: true

module Badges
  class BadgesList
    class << self
      def call
        list = []
        BADGE_PARAMS.each do |criterion, params|
          list << Badge.find_by_name(params.fetch(:name))
        end
        return list
      end
    end

    private

    BADGE_PARAMS = Badges::Constants::BadgeParams::BADGE_PARAMS
  end
end
