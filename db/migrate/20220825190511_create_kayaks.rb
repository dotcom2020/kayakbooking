class CreateKayaks < ActiveRecord::Migration[6.1]
  def change
    create_table :kayaks do |t|
      t.string :user_id
      t.integer :price_per_day
      t.string :adress
      t.string :description
      t.string :places
      t.string :color
      t.string :type
      t.integer :length
      t.integer :width
      t.boolean :buoy

      t.timestamps
    end
  end
end
