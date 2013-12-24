class User < ActiveRecord::Base
  has_many :mixtapes
  has_many :recommendations

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.location = auth.info.location
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def add_recommendation(user)
    # Grab our recommendation from the DB.
    recommendation = recommendations.find_by!(user_id: user)
    recommendation.increment!(:amount)

  rescue ActiveRecord::RecordNotFound
    recommendations.create(user_id: user, amount: 1)
  end
end
