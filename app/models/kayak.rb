class Kayak < ApplicationRecord
  has_many :bookings, dependent: :destroy

  CATEGORIES = ["Mer", "Rivière"]

  validates :price_per_day, :address, :description, :category, :places, :length, :width, presence: true
end
