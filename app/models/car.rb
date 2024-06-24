class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :picture

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 500, message: "Must be more than 500" }
  validates :picture, presence: true

  geocoded_by :address
  before_validation :geocode, if: :will_save_change_to_address?
end
