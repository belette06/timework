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
#  profiles_id :bigint
#
# Indexes
#
#  index_adresses_on_affaires_id  (affaires_id)
#  index_adresses_on_profiles_id  (profiles_id)
#
# Foreign Keys
#
#  fk_rails_...  (affaires_id => affaires.id)
#  fk_rails_...  (profiles_id => profiles.id)
#
class Adresse < ApplicationRecord



  def full_adresse
    "#{number} #{street} #{street2} #{zip} #{city} #{contry}"
  end

  private


end
