class AddSubjectFields < ActiveRecord::Migration
  def change
    add_column :subjects, :slug, :string
    add_column :subjects, :title, :string
    add_index :subjects, :slug
  end
end
