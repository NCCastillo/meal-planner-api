require "rails_helper"

describe User, type: :model do
  context "Associations" do 
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to have_many(:menus) }
  end

  context "when a valid email format is given" do 
    it "returns true" do 
      user = User.new(email: "john@example.com", password: "test", password_confirmation: "test")

      expect(user.valid?).to be true
    end
  end
  
  context "when an invalid email format is given" do 
    context "such as a missing @" do 
      it "returns false" do 
        user = User.new(email: "john.com", password: "test", password_confirmation: "test")
        
        expect(user.valid?).to be false 
      end
    end

    context "such as a missing ." do 
      it "returns false" do 
        user = User.new(email: "john@examplecom", password: "test", password_confirmation: "test")
        
        expect(user.valid?).to be false 
      end
    end
  end

  context "#current_menu" do 
    it "returns the menu for the current week" do 
      user = FactoryGirl.create(:user)
      last_week_menu = FactoryGirl.create(:menu, week_of: "2017-01-29_2017-02-04", user: user)
      current_week_menu = FactoryGirl.create(:menu, week_of: "2017-02-05_2017-02-11", user: user)

      expect(user.current_menu).to eq [current_week_menu]
    end

    it "returns blank [] when no current week" do 
      user = FactoryGirl.create(:user)
      last_week_menu = FactoryGirl.create(:menu, week_of: "2017-01-29_2017-02-04", user: user)

      expect(user.current_menu).to eq []
    end
  end
end
