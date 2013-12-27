class Asset < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image,
  :styles =>{
      :thumb => '100x100#',
      :medium => '300x300>',
      :large => '600x600>'
  }, :default_url => "/images/:style/missing.png"
end
