class UserInformation < ActiveRecord::Base
  belongs_to :user

  validates :music_genre, :about, :slogan, :presence => true, :on => :update
  validates_length_of :about, :minimum => 30, :maximum => 750, :allow_blank => false, :on => :update

end