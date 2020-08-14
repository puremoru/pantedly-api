class AddCompanyIdToRequirements < ActiveRecord::Migration[6.0]
  def change
    add_reference :requirements, :company, foreign_key: true
  end
end
