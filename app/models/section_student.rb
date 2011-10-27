class SectionStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :section

  validates :student, :start_year, :presence => true
  validates :section, :uniqueness => { :scope => [:student, :start_year]}, :presence => true

  def school_klass
    section.school_klass
  end
end
