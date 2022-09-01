class Depannage < ApplicationRecord
  has_many :worktimes
  accepts_nested_attributes_for :worktimes
  belongs_to :adresse


end
