class BadgesController < ApplicationController
  def index
    @badges = Badges::Constants::BadgesList.call
  end

  def user_badges
    @user_badges = current_user.badges
  end
end
