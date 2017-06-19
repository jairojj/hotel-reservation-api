class HotelsController < ApplicationController

  # GET /hotels
  def index
    @hotel = Hotel.all
    json_response(@hotel)
  end
  
  # POST /hotels
  def create
    @hotel = Hotel.create!(todo_params)
    json_response(@hotel, :created)
  end
  
  # DELETE /hotels/:id
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    head :no_content
  end
  
  # GET /hotels/:id
  def show
    @hotel = Hotel.find(params[:id])
    json_response(@hotel)
  end
  
  # PUT /hotels/:id
  def update
    @hotel = Hotel.find(params[:id])
    @hotel.update(todo_params)
    head :no_content
  end
  
  
  private
  def todo_params
    params.permit(:name, :localization)
  end
  
end
