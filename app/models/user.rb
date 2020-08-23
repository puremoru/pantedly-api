class User < ApplicationRecord
  belongs_to :company, optional: true
  has_many :interests, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :scouts, dependent: :destroy
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.search_by_address(prefecture, city)
    if prefecture && city
      User.where(company_id: nil, prefecture: prefecture, address1: city)
    elsif prefecture && !city
      User.where(company_id: nil, prefecture: prefecture)
    elsif
      User.where(company_id: nil, address1: city)
    end

  end
end
