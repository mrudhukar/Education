class School < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :code
  end

  has_many :school_klasses, :dependent => :destroy

  validates :name, :code, :presence => true

  after_create :create_classes

  private

  def create_class
    Klass.all.each do |klass|
      self.school_klasses.create!(:klass => klass)
    end
  end
end
