class CreateArmors < ActiveRecord::Migration[5.2]
  def change
    create_table :armors do |t|
      t.string :type
      t.string :serial_number
      t.references :robot, foreign_key: true

      t.timestamps
    end
  end
end
