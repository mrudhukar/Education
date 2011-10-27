class Section < ActiveRecord::Base

  belongs_to :school_klass

  validates :name, :presence => true, :uniqueness => {:scope => :school_klass}
  validates :school_klass, :presence => true
end
