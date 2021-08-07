class Department < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
