class AddFieldsToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :description, :text
    add_column :messages, :location, :string
    add_column :messages, :budget, :integer
    add_column :messages, :date, :integer
    add_column :messages, :start_time, :integer
    add_column :messages, :end_time, :integer
  end
end
