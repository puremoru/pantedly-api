class User < ApplicationRecord
  belongs_to :company, optional: true
  has_secure_password

  presence :name, presence: true
  presence :email, presence: true, uniqueness: true
end
