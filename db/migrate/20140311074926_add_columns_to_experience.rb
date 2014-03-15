class AddColumnsToExperience < ActiveRecord::Migration
  def change
  	add_column :experiences, :experience_name,:string
  	add_column :experiences, :special, :string
  	add_column :experiences, :budget, :string
  	add_column :experiences, :description, :text
  end
end
