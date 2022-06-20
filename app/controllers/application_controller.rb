class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  private
  def require_login
    unless current_user
      redirect_to login_url
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  def after_sign_in_path_for(users)
   profiles_path
 end
end
