class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, :null => false
      t.string :postal_code
      t.string :prefecture
      t.string :address1
      t.string :address2

      t.timestamps
    end
  end
end
