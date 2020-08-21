class AddNeedReasonToRequirements < ActiveRecord::Migration[6.0]
  def change
    add_column :requirements, :need_reason, :boolean, :default => false
  end
end
