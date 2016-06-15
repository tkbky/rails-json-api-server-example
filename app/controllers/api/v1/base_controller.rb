class Api::V1::BaseController < ApplicationController

  before_action :authenticate_user!

  private

  def current_user
    @current_user
  end

  def authenticate_user!
    auth_token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

    user = User.find_by(email: options&.dig(:email))

    if user && user.auth_token && ActiveSupport::SecurityUtils.secure_compare(user.auth_token, auth_token)
      @current_user = user
    else
      render head: :ok, status: 401
    end
  end

  def jsonapi_params(*args)
    params.require(:data).permit(:type, attributes: args)[:attributes] || {}
  end

end
