class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :books, dependent: :destroy
  attachment :profile_image
  
  validates :name, presence: true, length: { minimum: 2, maximum: 20}
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :introduction, length: { maximum: 50}
end
