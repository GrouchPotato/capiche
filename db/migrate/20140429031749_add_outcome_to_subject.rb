class AddOutcomeToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :outcome, :text
  end
end
