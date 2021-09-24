class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :bookers, dependent: :destroy
  attachment :profile_image
  
  validates :name, presence: true, length: { minimum: 2, maximum: 20}
  validates :email, presence: true
end
