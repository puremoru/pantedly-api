class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :postal_code, :string
    add_column :users, :prefecture, :string
    add_column :users, :address1, :string 
    add_column :users, :address2, :string
  end
end
