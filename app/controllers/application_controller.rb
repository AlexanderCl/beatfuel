class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.is_admin
  end

  def has_recommended(profile_id)
    if current_user
      @recommendation = Recommendation.find_by_user_id_and_profile_id!(current_user.id,profile_id)
      true
    end

  rescue ActiveRecord::RecordNotFound
    false
  end

  helper_method :has_recommended

  helper_method :current_user
  helper_method :current_admin
end
