class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: authentication_params[:email])
    if user&.authenticate(authentication_params[:password])
      token = encode_token({ user_id: user.id })
      render json: { token: token }, status: :created
    else
      render json: { message: 'Password or email invalid.' }, status: :unauthorized
    end
  end

  # destroy da session é feito no front

  private

  def authentication_params
    params.permit(:email, :password)
  end
end
