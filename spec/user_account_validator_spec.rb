require 'spec_helper'

describe UserAccountValidator do

  let(:user) { UserAccountValidator.new({ email: "seth@email.com", username: "setht", name: "Seth" }) }

  describe "#initialize" do
    it "creates a new account and with a valid name" do
      expect(user.name).to eq("Seth")
    end

    it "creates a new account with a valid email address" do
      expect(user.email).to eq("seth@email.com")
    end

    it "creates a new account wtih a vaild username" do
      expect(user.username).to eq("setht")
    end
  end

  describe "#validate" do
    it "checks for a valid email address" do
      expect(user.email).to eq("seth@email.com")
    end

    it "checks for an @ symbol"do
      expect(user.email_symbol_missing?).to eq(false)
    end

    it "checks for a valid username" do
      expect(user.username_missing?).to eq(false)
    end
  end

  describe "#email_missing?" do
    it "raises EmailMissingError if the email address is not valid" do
      expect(user.email_missing?).to eq(false)
    end
  end

end
