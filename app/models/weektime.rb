# frozen_string_literal: true

# == Schema Information
#
# Table name: weektimes
#
#  id           :bigint           not null, primary key
#  accord       :boolean          default(FALSE)
#  dateweek     :date
#  numsemaine   :integer
#  workweek     :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#  worktimes_id :bigint
#
# Indexes
#
#  index_weektimes_on_id            (id) UNIQUE
#  index_weektimes_on_user_id       (user_id)
#  index_weektimes_on_worktimes_id  (worktimes_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (worktimes_id => worktimes.id)
#
class Weektime < ApplicationRecord
  belongs_to :user
  has_many :worktimes, dependent: :delete_all
  accepts_nested_attributes_for :worktimes

  attr_accessor :flash_alert_message, :to_do_time

  validates_presence_of :dateweek
  validates_uniqueness_of :numsemaine, scope: :user_id,
                                       message: "Feuille d'heure exist"
  
  #before_validation :update_accord_status 

  before_validation :update_weekhour
  before_validation :convert_weekhour

  before_validation :add_num_date, on: %i[create update]
  after_validation :calcul_max_heur
  
  
  paginates_per 8
  
  
  def to_do_time(s)
    h = s / 3600
    s -= h * 3600
  
    m = s / 60
    s -= m * 60
  
    [h, m].join(":")
  end



  private


 

  def add_num_date
    update_attribute(:numsemaine, dateweek.cweek) if dateweek.present?
  end

  def update_weekhour
    update_columns(workweek: workweek) unless workweek.zero?
  end

  def convert_weekhour
    self.workweek = workweek / 3600
  end

  def calcul_max_heur
    if workweek > 180000 # valeur 50h //3600 sec = 60 minutes
      self.flash_alert_message = "Erreur trop d'heure saisie"
      raise ActiveRecord::Rollback
    end
  end



end
