class RoomsController < ApplicationController
  before_action :set_hotel
  before_action :set_hotel_room, only: [:show, :update, :destroy]

  # GET /hotel/:hotel_id/rooms
  def index
    json_response(@hotel.rooms)
  end

  # GET /hotel/:hotel_id/rooms/:id
  def show
    json_response(@room)
  end

  # POST /hotel/:hotel_id/rooms
  def create
    @room = @hotel.rooms.create!(room_params)
    json_response(@room, :created)
  end

  # PUT /hotel/:hotel_id/rooms/:id
  def update
    @room.update(room_params)
    head :no_content
  end

  # DELETE /hotel/:hotel_id/rooms/:id
  def destroy
    @room.destroy
    head :no_content
  end

  private

  def room_params
    params.permit(:max_quantity, :daily_price)
  end

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def set_hotel_room
    @room = @hotel.rooms.find_by!(id: params[:id]) if @hotel
  end

end
