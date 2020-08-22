class User < ApplicationRecord
  belongs_to :company, optional: true
  has_many :interests, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :scouts, dependent: :destroy
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
