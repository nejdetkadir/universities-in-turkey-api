class College < ApplicationRecord
  belongs_to :university

  validates_presence_of :name
  validates_uniqueness_of :name
end
