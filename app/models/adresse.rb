# == Schema Information
#
# Table name: adresses
#
#  id         :bigint           not null, primary key
#  body       :text
#  city       :string
#  contry     :integer          default("France")
#  number     :string
#  street     :string
#  street2    :string
#  zip        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Adresse < ApplicationRecord

  enum contry: %i[France Monaco Italie]
 

  def full_adresse
    "#{number} #{street} #{street2} #{zip} #{city} #{contry}"
  end



  private


end
