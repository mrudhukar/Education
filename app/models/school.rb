class School < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :code
  end

  validates :name, :code, :presence => true
end
