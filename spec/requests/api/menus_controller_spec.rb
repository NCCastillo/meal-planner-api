require "rails_helper"

describe Api::V1::MenusController, type: :request do 
  context "POST /menus" do 
    let(:menu_params) do 
      { menu: 
        { 
          week_of: "20170205_20170211"
        }
      }
    end

    let(:user) { FactoryGirl.create(:user) }
    let(:token) { JwToken.encode({user: user.id}) }
    let(:headers) { { 'Accept' => 'application/json', "Authorization" => "Bearer #{token}" } }

    context "without a valid JWT token" do 
      it "returns unauthorized" do 
        headers.delete("Authorization")

        post "/api/v1/menus", params: menu_params, headers: headers

        expect(response.status).to eq 401
        expect(json["errors"]).to eq ["unauthorized"]
      end
    end

    context "with a valid JWT token" do 
      it "returns a successful response" do 
        post "/api/v1/menus", params: menu_params, headers: headers
        
        expect(response.status).to eq 201
      end
    end

    context "with valid attributes" do 
      it "creates a new menu" do 
        expect do 
          post "/api/v1/menus", params: menu_params, headers: headers
        end.to change(Menu, :count).by(1)
      end

      it "returns 201 status code" do 
        post "/api/v1/menus", params: menu_params, headers: headers
        
        expect(response.status).to eq 201
      end
    end
  end

  context "with invalid attributes" do 
    it "returns status 422"
    it "returns error messages"
  end

  context "GET /current_menu" do 
    it "return a current menu" do 
      get "/api/v1/menus/current_menu", headers: headers

      expect(json["current_menu"]).to eq "stuff here"
    end
  end
end
