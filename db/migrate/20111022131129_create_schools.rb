class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string    :name,               :null => false
      t.string    :code,               :null => false
      t.string    :crypted_password
      t.string    :password_salt
      t.string    :persistence_token,  :null => false
      t.string    :perishable_token,   :null => false, :default => ""

      t.integer   :login_count,         :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.integer   :failed_login_count,  :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.datetime  :last_request_at                                    # optional, see Authlogic::Session::MagicColumns
      t.datetime  :current_login_at                                   # optional, see Authlogic::Session::MagicColumns
      t.datetime  :last_login_at                                      # optional, see Authlogic::Session::MagicColumns

      t.text  :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
