class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :date
      t.string :stime
      t.string :etime

      t.timestamps null: false
    end
  end
end
