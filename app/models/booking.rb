class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :kayak

  validates :status, :total_price, :start_date, :end_date, presence: true
end
