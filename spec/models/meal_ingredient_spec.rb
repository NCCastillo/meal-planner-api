require 'rails_helper'

RSpec.describe MealIngredient, type: :model do
  it { is_expected.to belong_to(:meal) }
  it { is_expected.to belong_to(:ingredient) }
end
