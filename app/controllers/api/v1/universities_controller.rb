class Api::V1::UniversitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:create, :destroy]
  before_action :set_university, only: [:show, :destroy]

  def create
    @university = University.new(university_params)
    @university.save
    render json: @university
  end

  def index
    @universities = University.all
    render json: @universities, except: [:created_at, :updated_at]
  end

  def show
    render json: @university, include: [:colleges => {include: [:departments => {except: [:created_at, :updated_at, :owner_type, :owner_id]}], except: [:created_at, :updated_at]},
                                        :faculties => {include: [:departments => {except: [:created_at, :updated_at, :owner_type, :owner_id]}], except: [:created_at, :updated_at]}],
                                        except: [:created_at, :updated_at]
  end

  def destroy
    @university.destroy

    head :ok
  end

  private
    def university_params
      params.require(:university).permit(:name, :is_public)
    end

    def set_university
      @university = University.find(params[:id])
    end
end