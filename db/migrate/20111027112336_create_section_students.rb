class CreateSectionStudents < ActiveRecord::Migration
  def change
    create_table :section_students do |t|
      t.integer :section_id, :null => false
      t.integer :student_id, :null => false
      t.integer :start_year

      t.timestamps
    end
    add_index :section_students, [:section_id, :student_id]
  end
end
