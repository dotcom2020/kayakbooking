class Kayak < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  CATEGORIES = ["Mer", "Rivière"]

  validates :price_per_day, :adress, :description, :category, :places, :length, :width, presence: true

  has_one_attached :photo
end
