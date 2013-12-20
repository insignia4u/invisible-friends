require 'spec_helper'

describe Game do

  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }
  end

  describe "Factory" do
    it "creates a valid game" do
      expect(create(:game)).to be_valid
    end
  end

end
