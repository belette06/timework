# frozen_string_literal: true

# == Schema Information
#
# Table name: worktimes
#
#  id          :bigint           not null, primary key
#  accord      :boolean          default(FALSE)
#  daytime     :integer
#  endtime     :time
#  gotime      :time
#  workday     :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  affaire_id  :bigint
#  weektime_id :bigint           not null
#
# Indexes
#
#  index_worktimes_on_affaire_id   (affaire_id)
#  index_worktimes_on_weektime_id  (weektime_id)
#
# Foreign Keys
#
#  fk_rails_...  (affaire_id => affaires.id)
#  fk_rails_...  (weektime_id => weektimes.id)
#
class Worktime < ApplicationRecord
  belongs_to :weektime
  belongs_to :affaire

  attribute :dayrecords

  enum daytime: { lundi: 1, mardi: 2, mercredi: 3, jeudi: 4, vendredi: 5, samedi: 6, dimanche: 0 }

  # attr_reader :set_jour
  attr_accessor :flash_alert_message

  before_validation :insert_weektime_id, on: %i[create update]
  before_validation :insert_daytime, on: %i[create]
  validates_presence_of :affaire
  #validates :daytime, presence: true
  validates :gotime, presence: true
  validates :endtime, presence: true

  after_validation :calcul_heure, on: %i[create update]

  after_validation :validate_negative_heure, on: %i[create update]
  after_validation :calcul_max_heur, on: %i[create update]
  before_validation :create_bluk_day, on: %i[create ]

  private

  def update_accord_status
    update_attribute(:accord, true) if accord.valid?
  end

  def insert_daytime
    self.daytime = dayrecords.compact_blank.first.to_i
  end

  def create_bluk_day
    if dayrecords.compact_blank.second.present?
      dayrecords.shift
      day_create = dayrecords.map do |day| 
          { 
           daytime:day.to_i,
           weektime_id: weektime.id,
           gotime: gotime,
           endtime: endtime,
           workday: workday = endtime - gotime,
           affaire_id: affaire_id,
           created_at: Time.now, 
           updated_at: Time.now,
          } 
          end
      if day_create.present?
        Worktime.upsert_all(day_create) # unique_by: [:environment_id, :name])
      end  
    end

  end  

  def insert_weektime_id
    if weektime.id.nil?
      self.flash_alert_message = 'Erreur weektimes is nil'
      raise ActiveRecord::Rollback
    end
  end

  def calcul_heure
    self.workday = endtime - gotime

  end

  def add_affaire_in_work
    self.affaire = affaire
  end

  def calcul_max_heur
    if workday > 64800 # valeur 18h //3600 sec = 60 minutes
      self.flash_alert_message = "Erreur trop d'heure saisie"
      raise ActiveRecord::Rollback
    end
  end

  def validate_negative_heure
    if workday.negative? || workday.zero?
      self.flash_alert_message = 'Erreur de sasie des heures'
      raise ActiveRecord::Rollback
    end
  end




end
