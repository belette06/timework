# == Schema Information
#
# Table name: profils
#
#  id         :bigint           not null, primary key
#  firstname  :string
#  job        :string
#  lastname   :string
#  phone      :string
#  phone_supl :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  adresse_id :bigint
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profils_on_adresse_id  (adresse_id)
#  index_profils_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (adresse_id => adresses.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :profil do
    user { nil }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.name }
    phone { Faker::Number.leading_zero_number(digits: 10)  }
    phone_supl { Faker::Number.leading_zero_number(digits: 10)  }
    job { Faker::Job.title }
    adresse { nil }
  end
end
