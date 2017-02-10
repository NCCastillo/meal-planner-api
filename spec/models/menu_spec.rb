require "rails_helper"

describe Menu, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:meal) }
end
