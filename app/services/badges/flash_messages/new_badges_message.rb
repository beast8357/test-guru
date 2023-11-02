# frozen_string_literal: true

module Badges
  module FlashMessages
    class NewBadgesMessage
      class << self
        def call(number)
          number == MIN_NUMBER ? I18n.t('services.badges.flash_messages.new_badge') : I18n.t('services.badges.flash_messages.new_badges')
        end
      end

      private

      MIN_NUMBER = 1
    end
  end
end
