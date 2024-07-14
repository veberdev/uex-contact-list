require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations and relationships' do
    it { should validate_presence_of(:email) }
    it { is_expected.to have_many(:contacts) }
  end

  # tests with factories:
  let(:user) { build(:user) }

  it 'is a valid user' do
    expect(user).to be_valid
  end

  it 'is a valid user' do
    expect(user).to be_valid
  end

  it 'is invalid without an password' do
    user.password = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'has a valid email' do
    user.email = 'abc@abc.com'

    expect(user).to be_valid
  end

  it 'has an invalid email' do
    user.email = 'asd@as.2.123'
    expect(user).to_not be_valid
  end
end
