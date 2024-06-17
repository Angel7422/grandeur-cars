require 'faker'

Car.destroy_all

puts 'Creating 5 cars...'

5.times do
  car = Car.new(
    name: Faker::Vehicle.make_and_model,

    photo: "https://loremflickr.com/320/240/supercar",
    address: Faker::Address.full_address,
    price: rand(1000..3000),

    user_id: User.first.id
  )
  file = URI.open('https://cdn.motor1.com/images/mgl/9V8Jm/s1/1x1/kvc-ferrari-laferrari-finali-mondiali.webp')
  car.picture.attach(io: file, filename: 'car', content_type: 'image/png')
  car.save
end

puts '5 cars created!'
