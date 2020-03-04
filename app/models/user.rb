class User < ApplicationRecord

  validates_presence_of :password, require: true
  validates :email, uniqueness: true, presence: true

  has_secure_password
  has_secure_token :api_key
end
