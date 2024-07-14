# Base controller for API endpoints
class ApplicationController < ActionController::API
  include Authenticable
end
