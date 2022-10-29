class Book < ApplicationRecord
  belongs_to :user

  validates :title, :author, :year, :genre, presence: true
  validates :year, numericality: { only_integer: true }
  validates :genre, inclusion: %w[fantasy dystopian adventure romance horror thriller children]
  # TODO: Upload image for a book
end
