require 'rails_helper'

RSpec.describe Api::V1::AccountsController, type: :request do
  describe 'POST /api/v1/accounts' do
    context 'when params are valid' do
      let(:valid_params) do
        {
          email: Faker::Internet.email(domain: 'gmail.com'),
          password: Faker::Internet.password(max_length: 8, mix_case: false, special_characters: false)
        }
      end

      it 'creates a new user' do
        expect do
          post 'http://localhost:3000/api/v1/accounts', params: valid_params
        end.to change(User, :count).by(1)
      end

      it 'returns status 201' do
        post 'http://localhost:3000/api/v1/accounts', params: valid_params
        expect(response).to have_http_status(201)
      end
    end
  end
end
