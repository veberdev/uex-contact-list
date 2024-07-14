class Api::V1::AccountsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def index
    # should i revert this action and tests?
    render json: { message: 'healty check!' }, status: :ok
  end

  def create
    user = User.new(registration_params)

    if user.save
      token = encode_token({ user_id: user.id })
      render json: { user: { id: user.id, email: user.email }, token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.permit(:email, :password)
  end
end
