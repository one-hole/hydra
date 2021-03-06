class Api::BaseController < ApplicationController

  def authenticate
    raise AuthenticationError unless current_user
  end

  def current_page
    params.fetch(:page, 1).to_i
  end

  def per_size
    10
  end

  private

  def current_user
    token = request.headers['Authorization'].presence
    @current_user ||= User.find_by(token: token)
  end

end
