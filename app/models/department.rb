class Department < ApplicationRecord
  belongs_to :owner, polymorphic: true

  validates_presence_of [:name, :owner_type, :owner_id, :years, 
  :point_type, :quota, :quota_of_top_student_of_the_school, 
  :special_conditions, :order_of_success_of_last_year, :base_score_of_last_year]
end
