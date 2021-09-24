class Booker < ApplicationRecord
  belongs_to :user

  validates :book_name, presence: true, length: { minimum: 1}
  validates :caption, presence: true, length: { minimum: 1, maximum: 200}
end
