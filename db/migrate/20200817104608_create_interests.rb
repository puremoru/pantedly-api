class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.integer :user_id, index: true
      t.integer :requirement_id, index: true
      t.integer :degree, :null => false

      t.timestamps
    end
    add_foreign_key :interests, :users
    add_foreign_key :interests, :requirements
  end
end
