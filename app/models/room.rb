class Room < ApplicationRecord
  belongs_to :hotel
  has_many :reservations
  
  validates_presence_of :max_quantity, :daily_price
end
