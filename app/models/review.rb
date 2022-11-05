class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :content, length: { minimum: 5 }, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: 0..5 }
end
