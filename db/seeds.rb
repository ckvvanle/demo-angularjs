# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "duongtruong",
             email: "duongtruong@gmail.com",
             password: "foobar",
             password_confirmation: "foobar",
             role: 1,
             address: "fdsfdsfdsfdsfdsfsdasdsad",
             phone: "3454343242"
             )
p "Created #{User.count} users"
