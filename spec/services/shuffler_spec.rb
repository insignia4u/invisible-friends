require 'spec_helper.rb'

describe Shuffler do

  it "shuffles the participants of the game" do
   game = create(:game)

    for i in 0..5
      @friend = create(:friend)
      game.friends << @friend
    end
    Shuffler.new(game).shuffle!

    expect(game.friend_assignments.count).to eq(game.friends.count + 1)

  end

end
