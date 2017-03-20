class User < ApplicationRecord

  has_many :galleries
  has_many :photos, through: :galleries
  has_secure_password
  
end
