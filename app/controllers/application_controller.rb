class ApplicationController < ActionController::API
  rescue_from(ActiveRecord::RecordNotFound) { head :not_found }

  respond_to :json
end
