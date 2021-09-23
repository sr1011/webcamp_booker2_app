class Booker < ApplicationRecord
  belongs_to :user
  
  validates :book_name, presence: true
  validates :caption, presence: true, length: { maximum: 200}
end
