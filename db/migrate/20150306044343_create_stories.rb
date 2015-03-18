class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :from
      t.string :text
      t.integer :user_id
      t.string :title

      t.timestamps null: false
    end
  end
end
