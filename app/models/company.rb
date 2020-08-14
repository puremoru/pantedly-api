class Company < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :requirements, dependent: :destroy
end
