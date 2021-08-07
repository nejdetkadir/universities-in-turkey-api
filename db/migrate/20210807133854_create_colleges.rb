class CreateColleges < ActiveRecord::Migration[6.1]
  def change
    create_table :colleges, id: :uuid do |t|
      t.references :university, null: false, foreign_key: true, type: :uuid
      t.string :name

      t.timestamps
    end
  end
end
