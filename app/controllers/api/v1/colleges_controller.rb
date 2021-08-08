class Api::V1::CollegesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:create, :destroy]
  before_action :set_college, only: [:show, :destroy]

  def create
    @college = College.new(college_params)
    @college.save
    render json: @college
  end

  def index
    @colleges = College.all
    render json: @colleges
  end

  def show
    render json: @college, include: [:departments => {except: [:created_at, :updated_at, :owner_type, :owner_id]}, :university => {except: [:created_at, :updated_at]}],
                           except: [:created_at, :updated_at, :university_id]
  end

  def destroy
    @college.destroy

    head :ok
  end

  private
    def college_params
      params.require(:college).permit(:name, :university_id)
    end

    def set_college
      @college = College.find(params[:id])
    end
end