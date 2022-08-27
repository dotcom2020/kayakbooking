class RenameTypeToCategory < ActiveRecord::Migration[6.1]
  def change
    rename_column :kayaks, :type, :category
  end
end
