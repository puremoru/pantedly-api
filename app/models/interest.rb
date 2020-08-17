class Interest < ApplicationRecord
    belongs_to :users, optional: true
    belongs_to :requirements, optional: true

    validates :degree, presence: true
    validates :user_id, :uniqueness => {:scope => :requirement_id}

    enum degree: { little: 1, big: 2 }
end
