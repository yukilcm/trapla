class Travel < ApplicationRecord
  belongs_to :user
  has_many :schedules
  has_many :checklists
end
