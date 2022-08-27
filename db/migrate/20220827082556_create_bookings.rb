class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :kayak_id
      t.integer :user_id
      t.string :status
      t.integer :total_price

      t.timestamps
    end
  end
end
