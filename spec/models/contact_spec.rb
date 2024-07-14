require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations and relationships' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:zip_code) }
    it { is_expected.to belong_to(:user) }
  end
end
