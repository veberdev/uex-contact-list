class Contact < ApplicationRecord
  belongs_to :user
  paginates_per 10

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: { scope: :user_id }
  validates :phone, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true

  geocoded_by :full_address
  after_validation :geocode, if: :any_address_changed?

  def full_address
    [address, zip_code].compact.join(', ')
  end

  def any_address_changed?
    address_changed? || zip_code_changed?
  end
end
