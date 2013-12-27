class UserInformation < ActiveRecord::Base
  belongs_to :user

  validates :music_genre, :about, :slogan, :presence => true, :on => :update
  validates_length_of :about, :minimum => 50, :maximum => 750, :allow_blank => false
  #validates :image_url, :format => {
  #   :with => %r{\.(gif|jpg|png)$}i,
  #  :message => 'Must be a URL for GIF, JPG or PNG image!'
  #}

end