class User < ActiveRecord::Base
  has_many :mixtapes, dependent: :destroy
  has_many :recommendations, dependent: :destroy
  has_one :user_information, dependent: :destroy
  has_many :assets

  accepts_nested_attributes_for :user_information
  accepts_nested_attributes_for :assets, :allow_destroy => true

  def self.from_omniauth(auth)
    # Wat er moet gebeuren voor zoeken:
    # De gebruiker zijn longitude en latitude moet opgeslaan worden in user tabel
    # Hiervoor moet er dus migration AddLongLatToUser gedaan worden waarbij er longitude en latidude als decimals toegevoegd worden
    # Daarna zal long en lat moeten opgevraagd worden bij google maps api aangezien FB enkel city doorgeeft:
    # Dit kan als volgt: http://maps.googleapis.com/maps/api/geocode/json?address=Blankenberge&sensor=false&region=be
    # Het ophalen van gegevens bij google maps api doe je best in controller, dus je zal in session_controller na from_omniauth dit moeten doen

    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.location = auth.info.location
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

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
