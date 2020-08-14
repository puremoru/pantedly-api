class CreateRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :requirements do |t|
      t.string :title, :null => false
      t.text :initiative
      t.text :request_content

      t.timestamps
    end
  end
end
