class University < ApplicationRecord
  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :colleges
  has_many :faculties
end
