class Api::V1::UniversitiesController < ApplicationController
  # before_action :authenticate_user!

  def create
    @university = University.new(university_params)
    @university.save
    render json: @university
  end

  def index
    @universities = University.all
    render json: @universities
  end

  private
    def university_params
      params.require(:university).permit(:name, :is_public)
    end
end