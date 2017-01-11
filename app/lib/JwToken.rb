require "jwt"

class JwToken
  class << self
    def encode(payload)
      JWT.encode(payload, secret, hmac[:algorithm])
    end
    
    def decode(token)
      JWT.decode(token,  secret, true, hmac).first
    end

    private

    def hmac
      { algorithm: "HS256" }
    end

    def secret
      ENV["JWT_SECRET"]
    end
  end
end
