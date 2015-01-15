class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :address

      t.timestamps null: false
    end
  end
end
