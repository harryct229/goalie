class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :owner_id
      t.datetime :deadline
      t.string :description
      t.integer :target
      t.string :status
      t.string :type
      t.integer :current_quantity, default: 0

      t.timestamps
    end
  end
end
