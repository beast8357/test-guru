# frozen_string_literal: true

class UserBadgeCheckService

  def user_has_badge_with_name?(context, name)
    !context.user.badges.find_by_name(name).nil?
  end

end
