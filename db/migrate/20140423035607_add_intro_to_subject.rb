class AddIntroToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :intro, :text
  end
end
