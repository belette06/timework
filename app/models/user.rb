# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("technicien")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  profile_id             :bigint
#  weektime_id            :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_profile_id            (profile_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_weektime_id           (weektime_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#  fk_rails_...  (weektime_id => weektimes.id)
#
class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :weektimes
  accepts_nested_attributes_for :weektimes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[technicien moderateur admin]
  after_initialize :set_default_role, if: :new_record?
  after_create :created_profile

  def created_profile
    prof= self.create_profile!
    self.profile_id = prof.id
    self.save!
  end

  paginates_per 20


  def set_default_role
    self.role ||= :technicien
  end

 
private

  def admin
    self.role ||= :admin
  end
  


end
