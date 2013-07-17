class UsersController < ApplicationController
  before_filter :find_user

  def update
    if @user.update_attributes(params[:user])
      redirect_to root_path, :notice => 'User was successfully updated'
    else
      render :action => "edit"
    end
  end

  private
  def find_user
    if @user = User.find_by_id(session[:user_id])
      true
    else
      redirect_to bids_path, :notice => "You must log in first" 
    end
  end
end
