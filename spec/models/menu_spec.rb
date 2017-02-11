require "rails_helper"

describe Menu, type: :model do
  context "Associations" do 
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:menu_items) }
  end
end
