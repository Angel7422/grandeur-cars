require 'faker'

Car.destroy_all

puts 'Creating 5 cars...'

5.times do
  Car.create!(
    name: Faker::Vehicle.make_and_model,

    photo: "https://loremflickr.com/320/240/supercar",
    address: Faker::Address.full_address,
    price: rand(1000..3000),

    user_id: User.first.id
  )
end

puts '5 cars created!'
