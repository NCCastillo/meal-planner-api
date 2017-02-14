require "rails_helper"

describe Api::V1::MenusController, type: :request do 
  let(:user) { FactoryGirl.create(:user) }
  let(:token) { JwToken.encode({user: user.id}) }
  let(:headers) { { 'Accept' => 'application/json', "Authorization" => "Bearer #{token}" } }

  context "POST /menus" do 
    let(:menu_params) do 
      { menu: 
        { 
          week_of: "2017-02-05_2017-02-11"
        }
      }
    end

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

      it "returns serialize Menu" do 
        post "/api/v1/menus", params: menu_params, headers: headers
        
        results = json["menu"]

        expect(results["week_of"]).to eq menu_params[:menu][:week_of]
      end
    end

    context "with invalid attributes" do 
      it "returns status 422"
      it "returns error messages"
    end
  end

  context "GET /current_menu" do 
    context "when there is a current menu available" do 
      it "return the current menu" do 
        menu = FactoryGirl.create(:menu, week_of: "#{Date.today.beginning_of_week}_#{Date.today.end_of_week}", user: user)
        expected_results = [{ "id"=>menu.id, "week_of"=>"#{menu.week_of}", "menu_items"=>[] }]

        get "/api/v1/menus/current_menu", headers: headers
        
        expect(json["menus"]).to eq expected_results
      end
    end

    context "when there is no current menu available" do 
      it "returns a blank []" do 
        menu = FactoryGirl.create(:menu, week_of: "2017-01-22_2017-01-28", user: user)

        get "/api/v1/menus/current_menu", headers: headers
        
        expect(json["menus"]).to eq []
      end
    end
  end
end
