class Api::BaseController < ApplicationController

  def authenticate
    raise AuthenticationError unless current_user
  end

  private

  def current_user
    token = request.headers['Authorization'].presence
    @current_user ||= User.find_by(token: token)
  end

end
