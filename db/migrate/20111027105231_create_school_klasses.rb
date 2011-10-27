class CreateSchoolKlasses < ActiveRecord::Migration
  def change
    create_table :school_klasses do |t|
      t.integer :school_id, :null => false
      t.integer :klass_id, :null => false

      t.timestamps
    end
    add_index :school_klasses, [:school_id, :klass_id]
  end
end
