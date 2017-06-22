class ReservationsController < ApplicationController
  before_action :authorize_request
  attr_reader :current_user
  
  # POST /rooms/:room_id/reservations
  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.create!(reservations_params)
    json_response(@reservation, :created)
  end
  
  #GET /reservations
  def index
    @reservation = Reservation.where(user_id: @current_user.id)
    json_response(@reservation)
  end
  
  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
  
  def reservations_params
    params.permit(:check_in, :check_out, :total_price, :user_id)
  end
  
end
