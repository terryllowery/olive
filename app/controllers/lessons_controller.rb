class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :enrolled_in_course

  def show
    if ! enrolled_in_course
      redirect_to course_path(current_course), alert: "You haven't enrolled yet. Please enroll in course to see details."
    end

  end

  private

  def current_course
    @current_course ||= current_lesson.section.course
  end

  helper_method :enrolled_in_course
  def enrolled_in_course
    @enrolled_in_course ||= current_user.enrolled_in?(current_course)
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
