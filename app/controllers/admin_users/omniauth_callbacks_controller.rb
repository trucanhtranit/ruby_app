
class AdminUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = AdminUser.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        session[:user_id] = @user.id
        redirect_to admin_root_path
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
        # redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
  end
end
