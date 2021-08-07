class Api::V1::FacultiesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:create, :destroy]
  
  def create
    @faculty = Faculty.new(faculty_params)
    @faculty.save
    render json: @faculty
  end

  def index
    @faculties = Faculty.all
    render json: @faculties
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy

    head :ok
  end

  private
    def faculty_params
      params.require(:faculty).permit(:name, :university_id)
    end
end