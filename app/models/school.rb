class School < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :code
  end

  has_many :school_klasses, :dependent => :destroy
  has_many :klasses, :through => :school_klasses
  has_many :sections, :through => :school_klasses
  has_many :section_students, :through => :sections
  has_many :students, :through => :section_students

  validates :name, :code, :presence => true

  after_create :create_classes

  private

  def create_classes
    Klass.all.each do |klass|
      self.school_klasses.create!(:klass => klass)
    end
  end
end
