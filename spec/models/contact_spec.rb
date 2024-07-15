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

  let(:user) { create(:user) }
  let(:contact) { build(:contact, user: user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(contact).to be_valid
    end

    it 'is not valid without a name' do
      contact.name = nil
      expect(contact).to_not be_valid
    end

    it 'is not valid without a cpf' do
      contact.cpf = nil
      expect(contact).to_not be_valid
    end

    it 'is not valid with a duplicate cpf for the same user' do
      create(:contact, user: user, cpf: contact.cpf)
      expect(contact).to_not be_valid
    end

    it 'is valid with a duplicate cpf for a different user' do
      different_user = create(:user)
      create(:contact, user: different_user, cpf: contact.cpf)
      expect(contact).to be_valid
    end

    it 'is not valid without a phone' do
      contact.phone = nil
      expect(contact).to_not be_valid
    end

    it 'is not valid without an address' do
      contact.address = nil
      expect(contact).to_not be_valid
    end

    it 'is not valid without a zip_code' do
      contact.zip_code = nil
      expect(contact).to_not be_valid
    end

    describe 'geocoding' do
      before do
        allow(contact).to receive(:geocode)
      end

      it 'geocodes after validation if any address attribute changed' do
        contact.address = 'New Address'
        contact.save
        contact.valid?
        expect(contact).to have_received(:geocode)
      end
    end

    describe '#full_address' do
      it 'returns the full address' do
        expect(contact.full_address).to eq("#{contact.address}, #{contact.zip_code}")
      end
    end
  end
end
