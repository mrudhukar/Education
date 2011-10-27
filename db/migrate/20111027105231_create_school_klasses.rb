class CreateSchoolKlasses < ActiveRecord::Migration
  def change
    create_table :school_klasses do |t|
      t.integer :school, :null => false
      t.integer :klass, :null => false

      t.timestamps
    end
    add_index :school_klasses, [:school, :klass]
  end
end
