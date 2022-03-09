require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe "methods" do
    it "generatates a key" do
      user = User.create(email: "fake@example.com", password: "seacret", password_confirmation: "seacret", api_key: User.api_key_generate)
      expect(user.api_key).to be_a(String)
    end
  end
end
