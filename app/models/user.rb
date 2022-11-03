class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :books, dependent: :destroy
  has_many :trades

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
