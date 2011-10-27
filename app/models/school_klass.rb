class SchoolKlass < ActiveRecord::Base
  belongs_to :klass
  belongs_to :school

  validates :klass, :presence => true
  validates :school, :uniqueness => { :scope => :klass}, :presence => true
end
