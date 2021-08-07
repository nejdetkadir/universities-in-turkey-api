class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments, id: :uuid do |t|
      t.references :owner, null: false, type: :uuid, polymorphic: true
      t.string :name
      t.integer :years
      t.string :point_type
      t.integer :quota
      t.integer :quota_of_top_student_of_the_school
      t.string :special_conditions
      t.integer :order_of_success_of_last_year
      t.float :base_score_of_last_year

      t.timestamps
    end
  end
end
