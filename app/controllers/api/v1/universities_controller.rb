class Api::V1::UniversitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:create, :destroy]

  def create
    @university = University.new(university_params)
    @university.save
    render json: @university
  end

  def index
    @universities = University.all
    render json: @universities
  end

  def destroy
    @university = University.find(params[:id])
    @university.destroy

    head :ok
  end

  private
    def university_params
      params.require(:university).permit(:name, :is_public)
    end
end