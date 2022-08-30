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
#  profil_id              :bigint
#  weektime_id            :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_profil_id             (profil_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_weektime_id           (weektime_id)
#
# Foreign Keys
#
#  fk_rails_...  (profil_id => profils.id)
#  fk_rails_...  (weektime_id => weektimes.id)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(email: 'Article Title')
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
