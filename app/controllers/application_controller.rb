class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :confirmed_team_members

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :team_id
    devise_parameter_sanitizer.for(:account_update) << :team_id
  end

  def confirmed_team_members
    current_user.team.users.where.not(last_sign_in_at: nil).reverse
  end
end
