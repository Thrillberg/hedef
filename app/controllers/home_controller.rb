class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      redirect_to new_user_invitation_path
    else
      redirect_to team_path(current_user.team)
    end
  end
end
