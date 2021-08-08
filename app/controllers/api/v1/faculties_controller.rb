class Api::V1::FacultiesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:create, :destroy]
  before_action :set_faculty, only: [:show, :destroy]
  
  def create
    @faculty = Faculty.new(faculty_params)
    @faculty.save
    render json: @faculty
  end

  def index
    @faculties = Faculty.all
    render json: @faculties, except: [:created_at, :updated_at]
  end

  def show
    render json: @faculty, include: [:departments => {except: [:created_at, :updated_at, :owner_type, :owner_id]}, :university => {except: [:created_at, :updated_at]}],
                           except: [:created_at, :updated_at, :university_id]
  end

  def destroy
    @faculty.destroy

    head :ok
  end

  private
    def faculty_params
      params.require(:faculty).permit(:name, :university_id)
    end

    def set_faculty
      @faculty = Faculty.find(params[:id])
    end
end