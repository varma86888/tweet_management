class User < ApplicationRecord
  rolify
    has_secure_password
    has_many :tweets, dependent: :destroy
end
