class ApplicationController < ActionController::API
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def check_admin
    raise ActionController::RoutingError.new('You are not authorized as an admin') unless current_user.admin?
  end

  def not_found
    respond_with '{"error": "not_found"}', status: :not_found
  end
end
