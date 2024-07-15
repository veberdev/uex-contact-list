require 'rails_helper'
require 'support/request_spec_helper'

RSpec.describe 'Api::V1::Contacts', type: :request do
  include RequestSpecHelper

  let(:user) { create(:user) }
  let!(:contacts) { create_list(:contact, 2, user: user) }
  let(:headers) { { 'Authorization' => token_generator(user) } }
  let(:contact_id) { contacts.first.id }

  describe 'GET /index' do
    before { get 'http://localhost:3000/api/v1/contacts', headers: headers }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns contacts' do
      expect(json_body).not_to be_empty
      expect(json_body.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /contacts/:id' do
    before { get "http://localhost:3000/api/v1/contacts/#{contact_id}", headers: headers }

    context 'when the record exists' do
      it 'returns the contact' do
        expect(json_body).not_to be_empty
        expect(json_body['id']).to eq(contact_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:contact_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Contact/)
      end
    end
  end
end
