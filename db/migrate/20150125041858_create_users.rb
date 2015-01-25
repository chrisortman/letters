class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :facebook_id
      t.string :facebook_key
      t.string :twitter_id
      t.string :twitter_key

      t.timestamps null: false
    end
  end
end
