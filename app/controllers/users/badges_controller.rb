module Users
  class BadgesController < ApplicationController
    def index
      @user_badges = current_user.badges
    end
  end
end
