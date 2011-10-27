class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :surname
      t.date   :dob
      t.string :gender
      t.string :father_first_name
      t.string :father_surname
      t.string :mother_first_name
      t.string :mother_surname
      t.string :gaurdian_first_name
      t.string :gaurdian_surname
      t.string :caste
      t.string :minority
      t.string :father_income_source
      t.string :father_number
      t.string :gaurdian_number
      t.boolean :bpl
      t.string :aadhar_uid
      t.text :current_address
      t.text :permanent_address

      t.boolean :status, :default => false

      t.timestamps
    end
  end
end
