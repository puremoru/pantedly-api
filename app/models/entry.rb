class Entry < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :requirement, optional: true

    validates :user_id, :uniqueness => {:scope => :requirement_id}
end
