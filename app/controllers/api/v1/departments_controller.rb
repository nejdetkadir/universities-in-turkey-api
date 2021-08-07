class Api::V1::DepartmentsController < ApplicationController
  # before_action :authenticate_user!

  def create
    @department = Department.new(department_params)
    @department.save
    render json: @department
  end

  def index
    @departments = Department.all
    render json: @departments
  end

  private
    def department_params
      params.require(:department).permit(:name, :owner_type, :owner_id, :years, 
      :point_type, :quota, :quota_of_top_student_of_the_school, 
      :special_conditions, :order_of_success_of_last_year, :base_score_of_last_year)
    end
end