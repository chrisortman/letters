class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :from
      t.string :text
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
