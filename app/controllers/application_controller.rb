# Base controller for API endpoints
class ApplicationController < ActionController::API
  before_action :authenticate_user!

  include Authenticable

  attr_reader :current_user

  def current_user
    @current_user ||= get_current_user
  end
end
