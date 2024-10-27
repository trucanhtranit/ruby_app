class Admin::SigninController < ApplicationController
  layout 'signin'
  def new
    if session[:user_id].present?
      redirect_to admin_root_path
    end

    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.find_by(email: params[:admin_user][:email])

    if @admin_user && @admin_user.authenticate(params[:admin_user][:password])
      session[:user_id] = @admin_user.id
      redirect_to admin_root_path
    else
      flash[:alert] = "Login failed"
      redirect_to new_admin_signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_admin_signin_path
  end
end
