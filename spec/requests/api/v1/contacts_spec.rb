require 'rails_helper'
require 'support/request_spec_helper'

RSpec.describe 'Api::V1::Contacts', type: :request do
  include RequestSpecHelper

  let(:user) { create(:user) }
  let(:headers) { { 'Authorization' => token_generator(user) } }

  describe 'GET /index' do
    it 'returns http success' do
      get 'http://localhost:3000/api/v1/contacts', headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'GET /show' do
  #   it 'returns http success' do
  #     get 'http://localhost:3000/api/v1/contacts/show:', headers: headers
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /create' do
  #   it 'returns http success' do
  #     get 'http://localhost:3000/api/v1/contacts/create', headers: headers
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /update' do
  #   it 'returns http success' do
  #     get 'http://localhost:3000/api/v1/contacts/update', headers: headers
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /destroy' do
  #   it 'returns http success' do
  #     get 'http://localhost:3000/api/v1/contacts/destroy', headers: headers
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
