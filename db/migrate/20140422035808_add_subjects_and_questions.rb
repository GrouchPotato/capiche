class AddSubjectsAndQuestions < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.timestamps
    end
    create_table :questions do |t|
      t.integer :subject_id
      t.timestamps
    end
  end
end
