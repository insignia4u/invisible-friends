require 'spec_helper.rb'

describe Shuffler do

  before :each do
    @game = create(:game)

    for i in 0..5
      @friend = create(:friend)
      @game.friends << @friend
    end
  end

  it "shuffles the participants of the game" do

    Shuffler.new(@game).shuffle!

    expect(@game.friend_assignments.count).to eq(@game.friends.count + 1)

    givers = []
    receivers = []
    @game.friend_assignments.each do |fa|
      givers    << fa.giver
      receivers << fa.receiver
    end

    participants = Array.new(@game.friends)
    participants << @game.user

    expect(givers).to eq(givers.uniq)
    expect(receivers).to eq(receivers.uniq)

    expect(givers.sort).to eq(participants.sort)
    expect(receivers.sort).to eq(participants.sort)

  end

end
