class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :author, :year, :genre, :available, presence: true
  validates :year, numericality: { only_integer: true }
  validates :genre, inclusion: { in: %w[fantasy dystopian adventure romance horror thriller children] }
  # TODO: Upload image for a book
end
