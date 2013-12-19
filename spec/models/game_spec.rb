require 'spec_helper'

describe Game do

  it { should belong_to(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }

  it "creates a game with valid data" do
    user = create(:user)
    expect { user.games.create(attributes_for(:game)) }.to change { Game.count }.by(1)
  end

  it "attempts to create a game without user" do
    game = build(:game)
    expect { game.save }.not_to change { Game.count }.by(1)
  end

end
