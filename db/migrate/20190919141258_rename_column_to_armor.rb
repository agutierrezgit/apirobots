class RenameColumnToArmor < ActiveRecord::Migration[5.2]
  def change
    rename_column :armors, :type, :armor_type
  end
end
