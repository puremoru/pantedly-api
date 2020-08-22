class Scout < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :company, optional: true

    validates :degree, presence: true
    validates :company_id, :uniqueness => {:scope => :user_id}

    enum degree: { normal: 1, premium: 2 }
end
