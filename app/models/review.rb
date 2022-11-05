class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :content, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: 0..5 }
end
