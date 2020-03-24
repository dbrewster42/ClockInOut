class User < ApplicationRecord
  has_secure_password
  belongs_to :position
  # has_one :position
end
