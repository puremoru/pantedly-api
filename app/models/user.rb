class User < ApplicationRecord
  belongs_to :company, optional: true
  has_secure_password
end
