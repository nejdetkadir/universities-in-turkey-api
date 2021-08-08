class Department < ApplicationRecord
  belongs_to :owner, polymorphic: true

  validates_presence_of [:name, :owner_type, :owner_id]
end
