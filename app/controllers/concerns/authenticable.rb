module Authenticable
  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.read)
  end

  def decoded_token
    return unless token_from_request_header

    begin
      JWT.decode(token_from_request_header, Rails.application.credentials.read, true)
    rescue JWT::DecodeError
      nil
    end
  end

  def authenticate
    return unless decoded_token

    begin
      user_id = decoded_token[0]['user_id']
      User.find(user_id)
    rescue ActiveRecorde::NotFound, JWT::DecodeError, JWT::EncodeError
      nil
    end
  end

  def token_from_request_header
    request.headers['Authorization']&.split&.last
  end

  def authenticate_user!
    unauthorized_entity unless authenticate
  end

  def get_current_user
    authenticate
  end

  private

  def unauthorized_entity
    render json: { message: 'Você precisa estar logado.' }, status: :unauthorized
  end
end
