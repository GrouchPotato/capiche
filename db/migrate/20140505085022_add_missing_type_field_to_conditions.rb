class AddMissingTypeFieldToConditions < ActiveRecord::Migration
  def change
    add_column :conditions, :type, :string
  end
end
