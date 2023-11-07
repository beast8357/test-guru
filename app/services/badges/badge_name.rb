# frozen_string_literal: true

module Badges
  class BadgeName
    class << self
      def call(criterion)
        params = Badges::Constants::BadgeParams::BADGE_PARAMS
        params.fetch(criterion).fetch(:name)
      end
    end
  end
end
