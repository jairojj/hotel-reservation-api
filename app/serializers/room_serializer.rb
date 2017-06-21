class RoomSerializer < ActiveModel::Serializer
  attributes :id, :max_quantity, :daily_price
  belongs_to :hotel
end
