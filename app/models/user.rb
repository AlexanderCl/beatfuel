class User < ActiveRecord::Base
  has_many :mixtapes, dependent: :destroy
  has_many :user_images, dependent: :destroy
  has_many :recommendations, dependent: :destroy
  has_one :user_information, dependent: :destroy



  accepts_nested_attributes_for :user_information

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
     loc = auth.info.location.split(',')[0]
     response = HTTParty.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{loc}&sensor=false&region=be")
     lat = response.parsed_response["results"].first["geometry"]["location"]["lat"]
     lng = response.parsed_response["results"].first["geometry"]["location"]["lng"]

      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.location = auth.info.location
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.latitude = lat
      user.longitude = lng

      user.save!
      if user.user_information.blank?
        user.create_user_information(slogan:"Change this into your personal slogan", about:"Tell us something about yourself", music_genre:"Example: Hiphop, dubstep, house")
      end

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
