require 'rails_helper'

  describe User do
    let(:user) { User.create!(email: "barbara47623@gmail.com", password: "secret") }

    it "is a valid email" do
      expect(user.email).to eq "barbara47623@gmail.com"
    end

    it "is a valid password" do
      expect(user.password).to eq "secret"
    end

    it "is not a valid email without a password" do
      expect(User.new(email: "john@gmail.com")).not_to be_valid
    end

  end
