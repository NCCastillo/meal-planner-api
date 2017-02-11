require 'rails_helper'

describe Ingredient, type: :model do
  context "Associations" do 
    it { is_expected.to have_many(:meal_ingredients) }
    it { is_expected.to have_many(:meals).through(:meal_ingredients) }
  end
end
