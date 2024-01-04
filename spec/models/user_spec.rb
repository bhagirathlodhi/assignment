# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "User create" do
  
    it "user valid with all attributes " do
      user = build(:user)
      expect(user).to be_valid
    end

    it "not valid without email" do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it "not valid without password" do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it "not valid with short password" do
      user = build(:user, password: "short")
      expect(user).to_not be_valid
    end

    it "not valid with wrong password" do
      user = build(:user, password: "short123")
      expect(user).to_not be_valid
    end

    it "not valid with without password and email" do
      user = build(:user, email: nil, password: nil)
      expect(user).to_not be_valid
    end

    it " not valid with duplicate email address" do
      create(:user, email: "test@example.com")
      user = build(:user, email: "test@example.com")
      expect(user).to_not be_valid
    end
  end
end
