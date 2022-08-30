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
#
# Indexes
#
#  index_adresses_on_affaires_id  (affaires_id)
#
# Foreign Keys
#
#  fk_rails_...  (affaires_id => affaires.id)
#
class Adresse < ApplicationRecord
  has_many :affaires
  accepts_nested_attributes_for :affaires


  def full_adresse
    "#{number} #{street} #{street2} #{zip} #{city} #{contry}"
  end

  private
  def save_affaires_id
    self.affaires_id= affaires_id
  end


end
