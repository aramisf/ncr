class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :classroom_id

      t.timestamps
    end
  end
end
