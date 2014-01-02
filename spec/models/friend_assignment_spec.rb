require 'spec_helper'

describe FriendAssignment do

  describe "Associations" do
    it { should belong_to(:game) }
    it { should belong_to(:giver) }
    it { should belong_to(:receiver) }
  end

  describe "Validations" do
    it { should validate_presence_of(:game) }
    it { should validate_presence_of(:giver) }
    it { should validate_presence_of(:receiver) }
  end
end
