class Admin::AdminUsersController < AdminController
  def index
    @pagy, @admin_users = pagy(AdminUser.all)
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)

    if @admin_user.save
      redirect_to admin_admin_users_path
    else
      render :new
    end
  end

  def edit
    @admin_user = AdminUser.find_by(params[:id])
  end

  def update
    @admin_user = AdminUser.find_by(params[:id])

    if @admin_user.update(admin_user_params)
      redirect_to admin_admin_users_path
    else
      render :edit
    end
  end

  private
  def admin_user_params
    params.require(:admin_user).permit(:email, :password, :first_name, :last_name, :super_admin, :password_confirmation)
  end
end
