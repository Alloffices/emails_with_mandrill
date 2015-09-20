class AddGeneralToUser < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :about, :text
    add_column :users, :skill, :string
    add_column :users, :connection, :string
  end
end
