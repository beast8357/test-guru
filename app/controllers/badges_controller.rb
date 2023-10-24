class BadgesController < ApplicationController
  def index
    @badges = Badges::BadgesList.call
  end

  def user_badges
    @user_badges = current_user.badges
  end
end
