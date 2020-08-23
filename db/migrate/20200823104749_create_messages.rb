class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id, :null => false, index:true
      t.integer :reciever_id, :null => false, index: true
      t.text :content

      t.timestamps
    end
    add_foreign_key :messages, :users, column: :sender_id
    add_foreign_key :messages, :users, column: :reciever_id
  end
end
