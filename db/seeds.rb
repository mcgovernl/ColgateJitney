# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Driver.delete_all
Rider.delete_all
Review.delete_all

User.create!(email: 'liam@colgatejitney.com', password: 'test123', password_confirmation: 'test123') #user id 1
User.create!(email: 'jack@colgatejitney.com', password: 'test123', password_confirmation: 'test123') #user id 2
User.create!(email: 'ryan@colgatejitney.com', password: 'test123', password_confirmation: 'test123') #user id 3
User.create!(email: 'peyton@colgatejitney.com', password: 'test123', password_confirmation: 'test123') #user id 4
User.create!(email: 'harrison@colgatejitney.com', password: 'test123', password_confirmation: 'test123') #user id 5
User.create!(email: 'steve@colgatejitney.com', password: 'test123', password_confirmation: 'test123') #user id 6

Driver.create!(first: 'Liam',last: 'McGovern',make: 'Ford',model: 'Explorer',plate: 'ESK543',seats: 8,available: true,user_id: 1,price: 100)
Driver.create!(first: 'Jack',last: 'Kerning',make: 'Jeep',model: 'Wrangler',plate: 'JDK456',seats: 4,available: true,user_id: 2,price: 69)
Driver.create!(first: 'Ryan',last: 'Wetsman',make: 'Kia',model: 'Sorento',plate: 'OPA808',seats: 6,available: true,user_id: 3,price: 33.33)
Driver.create!(first: 'Peyton',last: 'Baker',make: 'Honda',model: 'Prius',plate: 'GOGREEN',seats: 4,available: false,user_id: 4, price: 0.01)
Driver.create!(first: 'Harrison',last: 'Chen',make: 'Toyota',model: 'Tundra',plate: 'Z00M3R',seats: 3,available: true,user_id: 5,price: 420)
Driver.create!(first: 'Steve',last: 'Stevenson',make: 'Tesla',model: 'X',plate: 'B0RN2R1D3',seats: 7,available: true,user_id: 6,price: 80085)

Rider.create!(first: 'Liam',last: 'McGovern',destination: "110 Broad Street",user_id: 1,has_ride: false,start: "13 Oak Drive")
Rider.create!(first: 'Jack',last: 'Kerning',destination: "6 Pine Street",user_id: 2,has_ride: false,start: "13 Oak Drive")
Rider.create!(first: 'Ryan',last: 'Wetsman',destination: "Library Cafe",user_id: 3,has_ride: false,start: "13 Oak Drive")
Rider.create!(first: 'Peyton',last: 'Baker',destination: "The Jug",user_id: 4,has_ride: false,start: "13 Oak Drive")
Rider.create!(first: "Harrison", last: "Chen",destination: "Wynn Hall",user_id: 5,has_ride: false,start: "13 Oak Drive")
Rider.create!(first: 'Steve',last: 'Stevenson',destination: "The Pound",user_id: 6,has_ride: false,start: "13 Oak Drive")

# Review.create!(stars: 5,description: "All you could ask for from a driver",driver_id: 1, rider_id: 5)
# Review.create!(stars: 3,description: "Made me spill my drink on myself",driver_id: 3, rider_id: 4)
# Review.create!(stars: 4,description: "Literally a driving dog",driver_id: 6, rider_id: 4)
# Review.create!(stars: 1,description: "Pigsty of a Car",driver_id: 2, rider_id: 1)
# Review.create!(stars: 5,description: "Absolute Legend",driver_id: 5, rider_id: 2)
# Review.create!(stars: 5,description: "Was at a family wedding out of town and this driver was awesome!  Wedding was in the woods and he found the place to drop us off, AND picked us up in the pouring rain.  Highly recommend;  will use again when Im back in Hamilton!!",driver_id: 4, rider_id: 3)
# Review.create!(stars: 2,description: "Who gave this man a license",driver_id: 4, rider_id: 3)
