require 'rails_helper'

RSpec.describe 'Rooms API' do
  # Initialize the test data
  let!(:hotel) { create(:hotel) }
  let!(:rooms) { create_list(:room, 20, hotel_id: hotel.id) }
  let(:hotel_id) { hotel.id }
  let(:id) { rooms.first.id }

  # Test suite for GET /hotels/:hotel_id/rooms
  describe 'GET /hotels/:hotel_id/rooms' do
    before { get "/hotels/#{hotel_id}/rooms" }

    context 'when hotel exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all hotels rooms' do
        expect(json.size).to eq(20)
      end
    end

    context 'when hotel does not exist' do
      let(:hotel_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Hotel/)
      end
    end
  end

  # Test suite for GET /hotels/:hotel_id/rooms/:id
  describe 'GET /hotels/:hotel_id/rooms/:id' do
    before { get "/hotels/#{hotel_id}/rooms/#{id}" }

    context 'when hotel room exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the room' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when hotel room does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Room/)
      end
    end
  end

  # Test suite for POST /hotels/:hotel_id/rooms
  describe 'POST /hotels/:hotel_id/rooms' do
    let(:valid_attributes) { { max_quantity: 4, daily_price: 500 } }

    context 'when request attributes are valid' do
      before { post "/hotels/#{hotel_id}/rooms", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/hotels/#{hotel_id}/rooms", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Max quantity can't be blank, Daily price can't be blank/)
      end
    end
  end

  # Test suite for PUT /hotels/:hotel_id/rooms/:id
  describe 'PUT /hotels/:hotel_id/rooms/:id' do
    let(:valid_attributes) { { max_quantity: 4, daily_price: 500 } }

    before { put "/hotels/#{hotel_id}/rooms/#{id}", params: valid_attributes }

    context 'when room exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the room' do
        updated_room = Room.find(id)
        expect(updated_room.max_quantity).to match(4)
      end
    end

    context 'when the room does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Room/)
      end
    end
  end

  # Test suite for DELETE /hotels/:hotel_id/rooms/:id
  describe 'DELETE /hotels/:hotel_id/rooms/:id' do
    before { delete "/hotels/#{hotel_id}/rooms/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
