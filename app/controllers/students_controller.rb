class StudentsController < ApplicationController
  before_action :authenticate_student!
  def show
    @mentorship = Mentorship.new(student: current_student)
  end
end
