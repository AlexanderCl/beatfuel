class SessionsController < ApplicationController

  def create
    @user = User.find_by_uid!(request.env["omniauth.auth"].uid)
    session[:user_id] = @user.id
    redirect_to root_url
    flash[:notice] = "U bent ingelogd!"

  rescue ActiveRecord::RecordNotFound
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    flash[:notice] = "U bent afgemeld!"
  end
end