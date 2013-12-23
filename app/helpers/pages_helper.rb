module PagesHelper

  def current_users
    User.all.count
  end

  def current_mixtapes
    Mixtape.all.count
  end

  def current_recommendations
    Recommendation.all.count
  end
end
