class SectionStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :section

  validates :student, :start_year, :section, :presence => true
  validates :section_id, :uniqueness => { :scope => [:student_id, :start_year]}, :presence => true

  def school_klass
    section.school_klass
  end
end
