require 'faker'

Car.destroy_all

puts 'Creating 5 cars...'

5.times do
  Car.create!(
    name: Faker::Vehicle.make_and_model,
    photo: "https://source.unsplash.com/random/800x600?car",
    address: Faker::Address.full_address,
    price: rand(9000..900000),
    user_id: User.first.id
  )
end

puts '5 cars created!'





# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
