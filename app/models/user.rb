class User < ApplicationRecord
  has_secure_password

  validates :username, :password, :email, :first_name, :last_name, presence: true
end
