class HomeController < ApplicationController
  def index
    if user_signed_in? && current_user.admin?
      redirect_to new_user_invitation_path
    elsif user_signed_in?
      redirect_to team_path(current_user.team)
    else
      redirect_to new_user_registration_path
    end
  end
end
