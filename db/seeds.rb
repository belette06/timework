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


###################################################
# USER CONFIGURED
###################################################

User.create( email: 'teste@tt.com', password: '123456', role: 2 )
p "Created #{User.count} User admin"

5.times do
  User.create( email: Faker::Internet.email, password: '123456', role: 0 )
end
p "Created #{User.count} User technicien"

3.times do
  User.create(email: Faker::Internet.email, password: '123456', role: 1 )
end
p "Created #{User.count} User moderateur"

###################################################
# Weektime CONFIGURED
###################################################
weektimes= []

30.times do
 w = Weektime.new(
    user_id: 1,
    dateweek: Faker::Date.between(from: '2022-07-01', to: '2022-08-31'),
  )
  w.save
weektimes << w
 end
 p "Created #{Weektime.count} Weektime"

###################################################
# Adresse CONFIGURED
###################################################

 
adresse =[]

 30.times do
 adr = Adresse.new(
  number: Faker::Invoice.reference,
  street: Faker::Address.street_address,  
  street2: Faker::Address.secondary_address,
  zip: Faker::Address.zip,
  city: Faker::Address.city,
  contry: Faker::Address.country,
  body: Faker::Lorem.paragraph
)
adr.save
adresse << adr
end
p "Created #{Adresse.count} Adresse"


###################################################
# Affaires CONFIGURED
###################################################

#50.times do
#  Affaire.new(
#    number: Faker::Invoice.reference,
#    client: Faker::Name.name,
#    title: Faker::Construction.heavy_equipment,
#    adresse_id: adresse.find_by(1..10)
#
#  ).save
#  p "Created #{Affaire.count} Affaire"
#end
#
###################################################

#3.times do
#
#  day_create = worktimes.insert_all(
#    weektime_id: ,
#    gotime: DateTime.now,
#    endtime: Faker::Date.between(Time.now + 2),
#    daytime: Faker::Number.within(range: 1...3),
#    affaire_id: Faker::Number.within(range: 1...30)

#  ) 

#  Worktime.upsert_all(day_create)
#  p "Created #{Worktime.count} Worktime"
#end
#