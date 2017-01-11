require "rails_helper"
require "jwtoken"

describe JwToken do 
  let(:secret_key) { "secretKey" }
  let(:data) { { "user" => 1 } }
  let(:token) { JWT.encode(data, secret_key, "HS256") }
  
  describe ".encode" do 
    it "returns a token" do
      with_modified_env JWT_SECRET: secret_key do 
        expect(JwToken.encode(data)).to eq token
      end
    end
  end

  describe ".decode" do 
    it "decodes a token" do 
       with_modified_env JWT_SECRET: secret_key do 
        expect(JwToken.decode(token)).to eq data
       end
    end
  end

  def with_modified_env(options, &block)
    ClimateControl.modify(options, &block)
  end
end
