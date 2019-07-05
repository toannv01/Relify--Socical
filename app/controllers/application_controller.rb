# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :set_locale
  require 'json_web_token'
  include FormErrorsHelper
  include UsersHelper
  include SessionsHelper
  before_action :loginRequired

  # khi session current_user = nil thi chuyen huong tat ca cac trang ve trang login
  def loginRequired
    redirect_to root_url if current_user.nil?
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  protected

  # Validates the token and user and sets the @current_user scope
  def authenticate_request!
    if !payload || !JsonWebToken.valid_payload(payload.first)
      return invalid_authentication
    end

    load_current_user!
    invalid_authentication unless @current_user
  end

  # Returns 401 response. To handle malformed / invalid requests.
  def invalid_authentication
    render json: { error: 'Invalid Request' }, status: :unauthorized
  end

  private

  # Deconstructs the Authorization header and decodes the JWT token.
  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    JsonWebToken.decode(token)
  rescue StandardError
    nil
  end

  # Sets the @current_user with the user_id from payload
  def load_current_user!
    @current_user = User.find_by(id: payload[0]['user_id'])
  end
end
