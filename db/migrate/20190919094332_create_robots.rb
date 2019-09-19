class CreateRobots < ActiveRecord::Migration[5.2]
  def change
    create_table :robots do |t|
      t.string :name
      t.string :type
      t.string :serial_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
