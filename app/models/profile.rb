# == Schema Information
#
# Table name: profiles
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
#  index_profiles_on_adresse_id  (adresse_id)
#  index_profiles_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (adresse_id => adresses.id)
#  fk_rails_...  (user_id => users.id)
#
class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :adresse, optional: true
 


  has_one_attached :avatar, dependent: :destroy
 
 #validates :avatar, content_type: [:png, :jpg, :jpeg, :gif]






  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize_to_limit: [150,150]).processed 
    else
      "default_avatar.jpg"
    end
  end

  def avatar_nav
    if avatar.attached?
      avatar.variant(resize_to_limit: [30,25]).processed 
    else
      "avatar_nav.png"
    end
  end


  def full_name
    "#{firstname} #{lastname}"
  end

private
 
  def add_default_avatar
    return if avatar.attached?

      avatar.attach(
        io: File.open( Rails.root.join('app''assets''images''default_avatar.jpg' ) ),
         filename:'default_avatar.jpg', 
         content_type: 'image/jpg'
       )
    
  end



end
