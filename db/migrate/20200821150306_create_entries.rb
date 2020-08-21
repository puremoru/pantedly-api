class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :user_id, index: true
      t.integer :requirement_id, index: true
      t.text :reason

      t.timestamps
    end
    add_foreign_key :interests, :users
    add_foreign_key :interests, :requirements
  end
end
