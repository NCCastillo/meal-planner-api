require "jwtoken" 

class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    render json: { errors: ["unauthorized"] }, status: 401 unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: decode_token["user"]) if token_present?
  end

  private

  def token_present?
    request.headers["HTTP_AUTHORIZATION"].present?
  end

  def token
    request.headers["HTTP_AUTHORIZATION"].split(" ").last
  end

  def decode_token
    JwToken.decode(token)
  end
end
