class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_auth_for_sections_update, only: [:update]


  def create
    @section = current_course.sections.create(section_params)
    redirect_to instructor_course_path(current_course)
  end

  def update
    current_section.update_attributes(section_params)
  end

  private

  def require_auth_for_sections_update
    if current_course.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  def require_auth_for_current_course
    if current_course.user != current_user
      render plain: "Unautorized", status: :unauthorized
    end
  end

  def current_section
    #pry.binding

    @section ||= Section.find(params[:id])


  end

  helper_method :current_course
  def current_course
    if params[:course_id]
      @current_course ||= Course.find(params[:course_id])
    else
      current_section.course
    end

  end

  def section_params
    params.require(:section).permit(:title, :row_order_position)
  end
end
