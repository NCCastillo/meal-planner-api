require 'rails_helper'

describe Meal, type: :model do
  context "Associations" do 
    it { is_expected.to have_many(:meal_ingredients) }
    it { is_expected.to have_many(:ingredients).through(:meal_ingredients) }
  end
end
