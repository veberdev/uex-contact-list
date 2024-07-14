class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: { scope: :user_id }
  validates :phone, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
end
