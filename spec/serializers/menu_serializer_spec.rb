require "rails_helper"

describe MenuSerializer do
  it "Serializes Menu into JSON format" do
    serializer = MenuSerializer.new(Menu.new(id: 123, week_of: "20170205_20170211"))
    expected_results = '{"menu":{"id":123,"week_of":"20170205_20170211","menu_items":[]}}'
    
    expect(serializer.to_json).to eql(expected_results)
  end
end
