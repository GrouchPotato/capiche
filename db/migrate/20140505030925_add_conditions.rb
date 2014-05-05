class AddConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.integer :conditionable_id
      t.string :conditionable_type
      t.timestamps
    end
    add_index :conditions, [:conditionable_type, :conditionable_id]
  end
end
