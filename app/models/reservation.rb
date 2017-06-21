class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validates_presence_of :check_in, :check_out, :total_price
end
