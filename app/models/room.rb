class Room < ApplicationRecord
  belongs_to :hotel
  
  validates_presence_of :max_quantity, :daily_price
end
