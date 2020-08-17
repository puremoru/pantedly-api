class Requirement < ApplicationRecord
    belongs_to :company, optional: true
    has_many :interests

    validates :title, presence: true
end
