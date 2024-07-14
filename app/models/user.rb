class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w.+-]+@\w+\.\w+\z/, message: 'invalid format.' }
end
