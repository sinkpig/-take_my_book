class Book < ApplicationRecord
  belongs_to :user

  validates :title, :author, :year, :genre, presence: true
  validates :year, numericality: { only_integer: true }
  validates :genre, inclusion: %w[fantasy dystopian adventure romance horror thriller children]
  # TODO: Upload image for a book

  include PgSearch::Model
  pg_search_scope :search_by_attributes,
    against: [ :title, :author, :genre, :year ],
    using: { tsearch: { prefix: true } }
end
