class RenameColumnToRobots < ActiveRecord::Migration[5.2]
  def change
    rename_column :robots, :type, :robot_type
  end
end
