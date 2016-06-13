class Api::V1::SessionsController < Api::V1::BaseController

  skip_before_action :authenticate_user!, only: :create

  def create
    user = BasicAuth.new(find_user, session_params[:password]).call
    render json: user
  end

  private

  def find_user
    User.find_by!(email: session_params[:email])
  end

  def session_params
    jsonapi_params(:email, :password)
  end

end
