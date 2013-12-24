class RecommendationsController < ApplicationController
  def create
    @recommendation = Recommendation.find_by_user_id!(params[:user_id])
    @recommendation.increment!(:amount)

      redirect_to user_path(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    Recommendation.create(user_id: params[:user_id], amount: 1)
    end
end