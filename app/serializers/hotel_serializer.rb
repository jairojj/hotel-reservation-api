class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :localization
  has_many :rooms
end
