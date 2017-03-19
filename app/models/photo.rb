class Photo < ApplicationRecord

  has_one :user,  through: :galleries


end
