# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Flat.destroy_all
puts 'db is clean'
4.times do
  flat = Flat.create!(
    name: Faker::TvShows::RuPaul.queen,
    address: Faker::Games::Pokemon.location,
    description: Faker::Quote.matz,
    price_per_night: rand(75..100),
    number_of_guests: rand(3..8)
  )
  puts "flat #{flat.id} is created"
end
