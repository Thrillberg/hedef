class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      resource.admin = true
      resource.create_team(name: params[:user][:teams][:name]) unless params[:user][:teams][:name].blank?
      resource.save
    end
    RegistrationMailer.greet_user(@user).deliver
  end

  def edit
    if current_user
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def update
    params[:user].delete_if { |key, value| value.blank? }
    resource.update_attributes(clean_params)
    redirect_to root_path
  end

  def destroy
    @user = current_user
    @user.destroy
    if @user.destroy
        redirect_to root_url, notice: "Your account has been deleted."
    end
  end

  private

  def clean_params
    params.require(:user).permit(:email, :password, :password_confirmation, :team_id, :team)
  end
end
