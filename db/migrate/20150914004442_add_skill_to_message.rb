class AddSkillToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :skill, :string
  end
end
