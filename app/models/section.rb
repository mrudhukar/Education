class Section < ActiveRecord::Base

  belongs_to :school_klass

  has_many :section_students, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => {:scope => :school_klass_id}
  validates :school_klass, :presence => true
end
