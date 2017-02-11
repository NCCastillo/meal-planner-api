require 'rails_helper'

describe MenuItem, type: :model do
  context "Associations" do 
    it { is_expected.to belong_to(:meal) }
    it { is_expected.to belong_to(:menu) }
  end
end
