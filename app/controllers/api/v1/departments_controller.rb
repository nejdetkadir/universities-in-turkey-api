class Api::V1::DepartmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:create, :destroy]
  before_action :set_department, only: [:show, :destroy]
  
  def create
    @department = Department.new(department_params)
    @department.save
    render json: @department
  end

  def index
    @departments = Department.all
    render json: @departments
  end

  def show
    render json: @department, include: [:owner => {include: [:university => {except: [:created_at, :updated_at]}], except: [:university_id, :created_at, :updated_at]}],
                              except: [:created_at, :updated_at, :owner_type, :owner_id]

  end

  def destroy
    @department.destroy

    head :ok
  end

  private
    def department_params
      params.require(:department).permit(:name, :owner_type, :owner_id, :years, 
      :point_type, :quota, :quota_of_top_student_of_the_school, 
      :special_conditions, :order_of_success_of_last_year, :base_score_of_last_year)
    end

    def set_department
      @department = Department.find(params[:id])
    end
end