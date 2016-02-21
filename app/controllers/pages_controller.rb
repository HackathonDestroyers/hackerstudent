class PagesController < ApplicationController
  def home
    redirect_to hacker_path and return if current_hacker
    redirect_to student_path and return if current_student
  end
end
