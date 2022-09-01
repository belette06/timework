# == Schema Information
#
# Table name: adresses
#
#  id         :bigint           not null, primary key
#  body       :text
#  city       :string
#  contry     :string
#  number     :string
#  street     :string
#  street2    :string
#  zip        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :adresse do
    affaires { nil }
    number { Faker::Invoice.reference }
    street { Faker::Address.street_address }
    street2 { Faker::Address.secondary_address }
    zip { Faker::Address.zip }
    city { Faker::Address.city }
    contry { Faker::Address.country }
    body { Faker::Lorem.paragraph }
  end
end
