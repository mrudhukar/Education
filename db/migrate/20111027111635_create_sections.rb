class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :school_klass_id, :null => false
      t.string :name, :null => false

      t.timestamps
    end
    add_index :sections, :school_klass_id
  end
end
