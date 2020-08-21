class Interest < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :requirement, optional: true

    validates :degree, presence: true
    validates :user_id, :uniqueness => {:scope => :requirement_id}

    enum degree: { little: 1, big: 2 }
end
