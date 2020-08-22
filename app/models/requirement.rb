class Requirement < ApplicationRecord
    belongs_to :company, optional: true
    has_many :interests, dependent: :destroy

    validates :title, presence: true

    def self.get_by_address(prefecture, city)
        if prefecture && city
            Company.where(prefecture: prefecture, address1: city).map(&:requirements)
        elsif prefecture && !city
            Company.where(prefecture: prefecture).map(&:requirements)
        elsif !prefecture && city
            Company.where(address1: city).map(&:requirements)
        end
    end
end
