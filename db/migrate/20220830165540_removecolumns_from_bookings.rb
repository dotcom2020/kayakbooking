class RemovecolumnsFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :kayak_id
    remove_column :bookings, :user_id
    remove_column :kayaks, :user_id

    add_reference :bookings, :kayak, index: true
    add_reference :bookings, :user, index: true
    add_reference :kayaks, :user, index: true

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :description, :text
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date

    remove_column :kayaks, :places
    add_column :kayaks, :places, :integer
  end
end
