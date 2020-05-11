class DropUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :users do |t|
      t.string :name
      t.string :password
      t.string :address
      t.string :address_number
      t.integer :whatsapp
      t.boolean :admin

      t.timestamps
    end
  end
end
