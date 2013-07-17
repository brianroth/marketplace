class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.find_for_google_oauth2(request.env["omniauth.auth"])
    if user.persisted?
      sign_in(:user, user)
      session[:user_id] = user.id

      if user.gamecenter_id.nil?
        redirect_to edit_user_path, :notice => "Please update your user profile with a Apple gamecenter id"
      else
        redirect_to root_path, :notice => "Successfully authenticated #{user.email}"
      end
    else
      redirect_to root_path, :notice => "Login failed"
    end
  end
end

