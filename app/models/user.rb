class User < ApplicationRecord
  has_secure_password

  has_many :contacts, dependent: :destroy

  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w.+-]+@\w+\.\w+\z/, message: 'invalid format.' }
end
