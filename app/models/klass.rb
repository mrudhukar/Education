class Klass < ActiveRecord::Base
  NAME = [
    "Nursery", "LKG", "UKG",
    "1st Class", "2nd Class", "3rd Class", "4th Class", "5th Class", "6th Class", "7th Class",
    "8th Class", "9th Class", "10th Class", "11th Class", "12th Class"
  ]

  has_many :school_klasses, :dependent_destroy => true

  validates :name, :presence => true, :inclusion => {:in => NAME}, :uniqueness => true
end
