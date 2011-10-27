class SchoolKlass < ActiveRecord::Base
  belongs_to :klass
  belongs_to :school

  validates :klass, :presence => true
  valdiates :school, :uniqueness => { :scope => :klass}, :presence => true
end
