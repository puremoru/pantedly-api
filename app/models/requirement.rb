class Requirement < ApplicationRecord
    belongs_to :company, optional: true
    has_many :interests, dependent: :destroy

    validates :title, presence: true
end
