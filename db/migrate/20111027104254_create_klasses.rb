class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :name, :null => false
    end
    add_index :klasses, :name
  end
end
