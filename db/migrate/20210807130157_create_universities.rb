class CreateUniversities < ActiveRecord::Migration[6.1]
  def change
    create_table :universities, id: :uuid do |t|
      t.string :name
      t.boolean :is_public

      t.timestamps
    end
  end
end
