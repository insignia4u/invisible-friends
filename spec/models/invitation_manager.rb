require 'spec_helper'

describe InvitationManager do

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:game) }
  end

  describe "#invite" do
    it "invites an user to a game" do
      im = InvitationManager.new(name: "Userrrr", email: "email@email.com")
      im.game = create(:game)
      expect(im.invite).to be true
    end

    it "attemps to invite an user that was already invited" do
      im = InvitationManager.new(name: "Userrrr", email: "email@email.com")
      im.game = create(:game)
      im.invite
      expect(im.invite).to be false
    end

    it "attemps to invite an invalid user" do
      im = InvitationManager.new(name: "", email: "")
      im.game = create(:game)
      expect(im.invite).to be false
    end

  end

end
