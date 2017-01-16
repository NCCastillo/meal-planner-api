require "rails_helper"

describe User, type: :model do
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_presence_of(:email) }

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
end
