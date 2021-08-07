class Api::V1::CollegesController < ApplicationController
  # before_action :authenticate_user!

  def create
    @college = College.new(college_params)
    @college.save
    render json: @college
  end

  def index
    @colleges = College.all
    render json: @colleges
  end

  private
    def college_params
      params.require(:college).permit(:name, :university_id)
    end
end