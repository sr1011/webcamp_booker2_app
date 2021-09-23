class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :bookers, dependent: :destroy
  attachment :profile_image
end
