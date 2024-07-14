module Authenticable
  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.read)
  end
end
