class Faculty < ApplicationRecord
  belongs_to :university

  has_many :departments, as: :owner

  validates_presence_of :name
  validates_uniqueness_of :name
end
