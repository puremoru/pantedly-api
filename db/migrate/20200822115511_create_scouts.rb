class CreateScouts < ActiveRecord::Migration[6.0]
  def change
    create_table :scouts do |t|
      t.integer :company_id, index: true
      t.integer :user_id, index: true
      t.integer :degree

      t.timestamps
    end
    add_foreign_key :scouts, :users
    add_foreign_key :scouts, :companies
  end
end
