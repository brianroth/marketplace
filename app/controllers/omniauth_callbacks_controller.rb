class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.find_for_google_oauth2(request.env["omniauth.auth"])
    if user.persisted?
      flash[:notice] = "Successfully authenticated #{user.email}"
      sign_in(:user, user)
      session[:user_id] = user.id
    else
      flash[:notice] = "Login failed"
    end
    redirect_to bids_path
  end
end

