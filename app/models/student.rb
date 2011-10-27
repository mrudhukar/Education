class Student < ActiveRecord::Base
  has_many :section_students, :dependent => :destroy

  accepts_nested_attributes_for :section_students

  validates :first_name, :dob, :presence => true
  validates :gender, :inclusion => {:in => ProfileConstants::GENDER}, :presence => true
  validates :caste, :inclusion => {:in => ProfileConstants::CASTE}, :presence => true
  validates :minority, :inclusion => {:in => ProfileConstants::MINORITY}, :allow_blank => true

  def name
    self.first_name + " " + self.surname
  end
end
