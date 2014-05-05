class AddInputKeyAndComparatorToConditions < ActiveRecord::Migration
  def change
    add_column :conditions, :input_key, :string
    add_column :conditions, :comparator, :string
  end
end
