class StudentsController < ApplicationController
  before_filter :load_student, :only => [:show, :edit, :update, :destroy]

  def index
    @students = current_school.students.all
    @tab = TabConstants::HOME
  end

  def show
  end

  def new
    if request.xhr?
      @klass = Klass.find(params[:id])
      @sections = @klass.school_klasses.find_by_school_id(current_school.id).sections
    else
      @student = Student.new
      @student.section_students = [SectionStudent.new()]
    end
    
  end

  def edit
  end

  def create
    @student = Student.new(params[:student])
    @student.section_students.each do |sec_stu|
      sec_stu.student = @student
      sec_stu.start_year = Date.today.year
    end

    if @student.save
      redirect_to @student
      flash[:notice] = 'Student was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @student.update_attributes(params[:student])
      redirect_to @student
      flash[:notice]= 'Student was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @section_student.destroy
    redirect_to students_url
  end

  private

  def load_student
    @section_student = current_school.section_students.find_by_student_id!(params[:id])
    @student = @section_student.student
  end
end
