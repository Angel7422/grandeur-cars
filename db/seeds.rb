
Car.destroy_all

puts 'Creating cars...'

car_1 = Car.new(
  name: "Lamborghini Veneno",
  address: "Monaco",
  price: 3200 ,
  photo: "",
  user_id: User.first.id
)
file = URI.open('https://res.cloudinary.com/dfwstcrkv/image/upload/v1718373447/Veneno_wfrlw0.jpg')
car_1.picture.attach(io: file, filename: 'car', content_type: 'image/png')
car_1.save

car_2 = Car.new(
  name: "Porsche GT-4RS",
  address: "Marseille",
  price: 2800 ,
  photo: "",
  user_id: User.first.id
)
file = URI.open('https://res.cloudinary.com/dfwstcrkv/image/upload/v1718373447/porsche_gt4rs_lb7mfn.jpg')
car_2.picture.attach(io: file, filename: 'car', content_type: 'image/png')
car_2.save

car_3 = Car.new(
  name: "Koenigsegg Agera-RS",
  address: "Paris",
  price: 3700 ,
  photo: "",
  user_id: User.first.id
)
file = URI.open('https://res.cloudinary.com/dfwstcrkv/image/upload/v1718373446/koenigsegg_agera_rs_molucu.png')
car_3.picture.attach(io: file, filename: 'car', content_type: 'image/png')
car_3.save


car_4 = Car.new(
  name: "Maserati Gran Turismo S",
  address: "Nice",
  price: 3100 ,
  photo: "",
  user_id: User.first.id
)
file = URI.open('https://res.cloudinary.com/dfwstcrkv/image/upload/v1718373446/Maserati_Gran_Turismo_S_zhooap.png')
car_4.picture.attach(io: file, filename: 'car', content_type: 'image/png')
car_4.save

car_5 = Car.new(
  name: "Lamborghini Avantador",
  address: "Cannes",
  price: 3400 ,
  photo: "",
  user_id: User.first.id
)
file = URI.open('https://res.cloudinary.com/dfwstcrkv/image/upload/v1718373446/lamborghini_aventador_riy3af.png')
car_5.picture.attach(io: file, filename: 'car', content_type: 'image/png')
car_5.save

car_6 = Car.new(
  name: "Pagani Huayra",
  address: "Lyon",
  price: 3500 ,
  photo: "",
  user_id: User.first.id
)
file = URI.open('https://res.cloudinary.com/dfwstcrkv/image/upload/v1718373446/pagani_huayra_2_zpoqnv.png')
car_6.picture.attach(io: file, filename: 'car', content_type: 'image/png')
car_6.save

car_7 = Car.new(
  name: "Rolls-Royce Phantom",
  address: "Geneve",
  price: 3800 ,
  photo: "",
  user_id: User.first.id
)
file = URI.open('https://res.cloudinary.com/dfwstcrkv/image/upload/v1718373446/rolls_royce_phantom_fx3zbr.png')
car_7.picture.attach(io: file, filename: 'car', content_type: 'image/png')
car_7.save

car_8 = Car.new(
  name: "Anibal Icon",
  address: "Marseille",
  price: 3800 ,
  photo: "",
  user_id: User.first.id
)
file = URI.open('https://res.cloudinary.com/dfwstcrkv/image/upload/v1718373446/inibal_icon_dgdigc.jpg')
car_8.picture.attach(io: file, filename: 'car', content_type: 'image/png')
car_8.save

car_9 = Car.new(
  name: "Bugatti Chiron",
  address: "Monaco",
  price: 4200 ,
  photo: "",
  user_id: User.first.id
)
file = URI.open('https://res.cloudinary.com/dfwstcrkv/image/upload/v1718373446/bugatti_chiron_ueohm1.jpg')
car_9.picture.attach(io: file, filename: 'car', content_type: 'image/png')
car_9.save

car_10 = Car.new(
  name: "Ferrari Sp-48",
  address: "Lyon",
  price: 3100 ,
  photo: "",
  user_id: User.first.id
)
file = URI.open('https://res.cloudinary.com/dfwstcrkv/image/upload/v1718373446/ferrari_sp48_unica_k2gjmq.png')
car_10.picture.attach(io: file, filename: 'car', content_type: 'image/png')
car_10.save


puts 'All cars created!'
