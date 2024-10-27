class AdminController < ActionController::Base
  layout 'admin'
  include Pagy::Backend
  before_action :authenticate_admin_user

  private
  def authenticate_admin_user
    if session[:user_id].present?
      @admin_user = AdminUser.find_by(id: session[:user_id])
    end

    unless @admin_user
      redirect_to new_admin_signin_path
    end
  end
end
