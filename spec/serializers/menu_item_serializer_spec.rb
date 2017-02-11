require "rails_helper"

describe MenuItemSerializer do
  it "Serializes Menu Item into JSON format" do
    serializer = MenuItemSerializer.new(MenuItem.new(id: 12, menu_option: "Meal 1", day: "Friday"))
    expected_results = '{"menu_item":{"id":12,"menu_option":"Meal 1","day":"Friday"}}'
    
    expect(serializer.to_json).to eql(expected_results)
  end
end
