require 'rails_helper'

RSpec.describe User, type: :model do
  # tests with factories:
  let(:user) { build(:user) }

  it 'is a valid user' do
    expect(user).to be_valid
  end
end
