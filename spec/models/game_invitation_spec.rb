require 'spec_helper'

describe GameInvitation do

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:game) }
  end

end
