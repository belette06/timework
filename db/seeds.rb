# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Weektime.destroy_all
Affaire.destroy_all

User.create(
  email: 'teste@tt.com',
  password: '123456',
  role: 2
)
p "Created #{User.count} User"

3.times do
  User.create(
    email: Faker::Internet.email,
    password: '123456',
    role: 0
  )
  p "Created #{User.count} User"
end

###################################################
#
#
# 3.times do
#  Weektime.create(
#    user_id: 1,
#    dateweek: Faker::Date.between(from: '2022-07-01', to: '2022-08-31')
#  )
#  p "Created #{Weektime.count} Weektime"
# end
#
###################################################

# 3.times do
#   Worktime.create(
#     weektime_id: 1,
#     gotime: DateTime.now,
#     endtime: DateTime.now + 3,
#     daytime: Faker::Number.within(range: 1...3)
#   )
#   p "Created #{Worktime.count} Worktime"
# end

###################################################

3.times do
  Affaire.create(
    number: Faker::Invoice.reference,
    client: Faker::Name.name,
    address: Faker::Address.street_address,
    title: Faker::Construction.heavy_equipment
  )
  p "Created #{Affaire.count} Affaire"
end
