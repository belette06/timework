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
class Adresse < ApplicationRecord



  def full_adresse
    "#{number} #{street} #{street2} #{zip} #{city} #{contry}"
  end

  private


end
