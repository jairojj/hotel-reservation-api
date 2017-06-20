# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  Hotel.create(name: Faker::Company.name, localization: ["São Paulo", "Santos", "Campinas", "Salvador", "Pernambuco", "Bahia", "Rio de Janeiro", "Belo Horizonte", "Florianopolis", "Fernando de Noronha"].sample)
end

# @hotel = Hotel.all

# @hotel.each do |hotel|
#   5.times do
#     hotel.rooms.create(max_quantity: rand(1..10), daily_price: rand(500..1000))
#   end
# end
