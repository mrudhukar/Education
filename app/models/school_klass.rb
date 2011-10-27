class SchoolKlass < ActiveRecord::Base
  belongs_to :klass
  belongs_to :school

  has_many :sections, :dependent => :destroy

  validates :klass, :school, :presence => true
  validates :school_id, :uniqueness => { :scope => :klass_id}, :presence => true

  after_create :create_default_sections

  private

  def create_default_sections
    self.sections.create!(:name => "A")
    self.sections.create!(:name => "B")
  end
end
