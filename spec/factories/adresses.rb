# == Schema Information
#
# Table name: adresses
#
#  id          :bigint           not null, primary key
#  body        :text
#  city        :string           not null
#  contry      :string           not null
#  number      :string
#  street      :string           not null
#  street2     :string
#  zip         :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  affaires_id :bigint
#  profils_id  :bigint
#
# Indexes
#
#  index_adresses_on_affaires_id  (affaires_id)
#  index_adresses_on_profils_id   (profils_id)
#
# Foreign Keys
#
#  fk_rails_...  (affaires_id => affaires.id)
#  fk_rails_...  (profils_id => profils.id)
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
