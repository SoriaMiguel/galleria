class Photo < ApplicationRecord

  has_one :user,  through: :galleries

  mount_uploader :image, ImageUploader

end
