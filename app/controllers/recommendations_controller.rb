class RecommendationsController < ApplicationController

  def create
    @recommendation = Recommendation.find_by_user_id_and_profile_id!(current_user.id,params[:profile_id])
    redirect_to user_path(params[:profile_id])
  rescue ActiveRecord::RecordNotFound
    Recommendation.create(profile_id: params[:profile_id], user_id: current_user.id, amount: 1)
    redirect_to user_path(params[:profile_id])
  end

end