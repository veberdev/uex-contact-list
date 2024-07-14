# Base controller for API endpoints
class ApplicationController < ActionController::API
  before_action :authenticate_user!

  include Authenticable
end
