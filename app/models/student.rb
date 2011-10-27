class Student < ActiveRecord::Base
  validates :first_name, :dob, :presence => true
  validates :gender, :inclusion => {:in => ProfileConstants::GENDER}, :presence => true
  validates :caste, :inclusion => {:in => ProfileConstants::CASTE}, :presence => true
  validates :minority, :inclusion => {:in => ProfileConstants::MINORITY}, :allow_blank => true
end
