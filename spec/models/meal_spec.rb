require 'rails_helper'

RSpec.describe Meal, type: :model do
  it { is_expected.to have_many(:menus) }
  it { is_expected.to have_many(:meal_ingredients) }
  it { is_expected.to have_many(:ingredients).through(:meal_ingredients) }
end
