require "rails_helper"

describe Api::V1::UsersController, type: :request do 
  context "POST /users" do 
    let(:user_params) do 
      { user: 
        { 
          email: "test@example.com", 
          password: "secret", 
          password_confirmation: "secret",
          first_name: "John",
          last_name: "Doe"
        }
      }
    end

    let(:header) { { 'Accept' => 'application/json' } }

    context "with valid attributes" do
      it "creates a new user" do 
        expect do
          post "/api/v1/users", params: user_params, headers: headers
        end.to change(User, :count).by(1)
      end

      it "returns a 201 status code" do 
        post "/api/v1/users", params: user_params, headers: headers

        expect(response.status).to eq 201
      end

      it "returns JWT token" do 
        post "/api/v1/users", params: user_params, headers: headers

        expect(json["jwt"].present?).to eq true
      end
    end

    context "with invalid attributes" do 
      it "returns a 422 status code" do 
        user_params[:user][:password]="wrong"

        post "/api/v1/users", params: user_params, headers: headers

        expect(response.status).to eq 422
      end

      it "returns password does not match error message" do 
        user_params[:user][:password]="wrong"

        post "/api/v1/users", params: user_params, headers: headers

        expect(json["errors"].first).to eq "Password confirmation doesn't match Password"
      end

      it "returns email cannot be blank error" do 
        user_params[:user][:email]= ""

        post "/api/v1/users", params: user_params, headers: headers

        expect(json["errors"].first).to eq "Email can't be blank"
      end

      it "returns email is invalid error" do 
        user_params[:user][:email]= "www.com"

        post "/api/v1/users", params: user_params, headers: headers

        expect(json["errors"].first).to eq "Email is invalid"
      end
    end
  end
end
