require 'rails_helper'

RSpec.describe 'Hotel API', type: :request do
  # initialize test data 
  let!(:hotels) { create_list(:hotel, 10) }
  let(:hotel_id) { hotels.first.id }

  # Test suite for GET /hotels
  describe 'GET /hotels' do
    # make HTTP get request before each example
    before { get '/hotels' }

    it 'returns hotels' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /hotels/:id
  describe 'GET /hotels/:id' do
    before { get "/hotels/#{hotel_id}" }

    context 'when the record exists' do
      it 'returns the hotel' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(hotel_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:hotel_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Hotel/)
      end
    end
  end

  # Test suite for POST /hotels
  describe 'POST /hotels' do
    # valid payload
    let(:valid_attributes) { { name: 'São João', localization: 'Campinas' } }

    context 'when the request is valid' do
      before { post '/hotels', params: valid_attributes }

      it 'creates a hotel' do
        expect(json['name']).to eq('São João')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/hotels', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Localization can't be blank/)
      end
    end
  end

  # Test suite for PUT /todos/:id
  describe 'PUT /hotels/:id' do
    let(:valid_attributes) { { name: 'São Carlos', localization: 'EUA' } }

    context 'when the record exists' do
      before { put "/hotels/#{hotel_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /hotels/:id
  describe 'DELETE /hotels/:id' do
    before { delete "/hotels/#{hotel_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end