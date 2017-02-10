require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it { is_expected.to have_many(:meal_ingredients) }
  it { is_expected.to have_many(:meals).through(:meal_ingredients) }
end
