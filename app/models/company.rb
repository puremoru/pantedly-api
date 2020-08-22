class Company < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :requirements, dependent: :destroy
    has_many :scouts, dependent: :destroy

    validates :name, presence: true
end
