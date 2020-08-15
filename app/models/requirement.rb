class Requirement < ApplicationRecord
    belongs_to :company, optional: true

    validates :title, presence: true
end
