class ApplicationController < ActionController::API
  respond_to :json

  def check_admin
    raise ActionController::RoutingError.new('You are not authorized as an admin') unless current_user.admin?
  end
end
