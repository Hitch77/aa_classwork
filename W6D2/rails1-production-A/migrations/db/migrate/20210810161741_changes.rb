class Changes < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :location, :address
    add_index :restaurants, :owner_id
    rename_column :users, :passkey, :password
    remove_column :users, :favorite_cuisine
  end
end
