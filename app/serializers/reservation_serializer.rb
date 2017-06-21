class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :check_in, :check_out, :total_price
  belongs_to :user
  belongs_to :room
end
