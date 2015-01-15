class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.datetime :expires_at
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :api_keys, :user_id
  end
end
