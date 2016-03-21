class Users::InvitationsController < Devise::InvitationsController
  def new
    self.resource = resource_class.new
    render :new
  end

  def create
    params[:user][:email].each do |email|
      User.invite!(:email => email, :team_id => current_user.team.id)
    end
    redirect_to root_path
  end
end
