require 'rails_helper'

describe MealIngredient, type: :model do
  context "Associations" do 
    it { is_expected.to belong_to(:meal) }
    it { is_expected.to belong_to(:ingredient) }
  end
end
