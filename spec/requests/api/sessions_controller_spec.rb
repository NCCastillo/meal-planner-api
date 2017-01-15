require "rails_helper"

describe Api::V1::SessionsController, type: :request do 
  let(:user) { FactoryGirl.create(:user) }
  
  let(:user_params) do 
    { user: { email: user.email, password: user.password } }
  end

  let(:headers) do
    { 'Accept' => 'application/json' }
  end

  context "POST /login" do 
    context "with a valid user" do 
      it "returns 200" do 
        post "/api/v1/login", params: user_params, headers: headers

        expect(response.status).to eq 200
      end

      it "returns JWT token" do 
        token = JwToken.encode({user: user.id})

        post "/api/v1/login", params: user_params, headers: headers

        results = JSON.parse(response.body)

        expect(results["jwt"]).to eq token
      end
    end

    context "with an invalid user" do 
      it "returns 401" do 
        user_params[:user][:password] = "wrong"

        post "/api/v1/login", params: user_params, headers: headers

        expect(response.status).to eq 401
      end

      it "returns error message" do 
        user_params[:user][:password] = "wrong"

        post "/api/v1/login", params: user_params, headers: headers

        results = JSON.parse(response.body)

        expect(results["error"]).to eq "Invalid credentials"
      end
    end
  end
end
