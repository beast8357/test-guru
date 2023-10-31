class BadgesController < ApplicationController
  def index
    @badges = Badges::BadgesList.call
  end
end
