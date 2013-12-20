require 'spec_helper.rb'

feature "game management" do

  background do
    visit '/'
    @data= auth_data

    sign_in_with_facebook @data
  end

  scenario "Adding a game with valid data" do
    game = build(:game)

    click_on("Add New Game")
    fill_in "game[name]", with: game.name
    fill_in "game[scheduled_on]", with: game.scheduled_on
    fill_in "game[description]", with: game.description

    expect {
      click_on("Save")
    }.to change { Game.count }.by(1)

    saved_game = Game.last

    expect(saved_game.name).to eq game.name
    expect(saved_game.scheduled_on).to eq game.scheduled_on
    expect(saved_game.description).to eq game.description
    expect(saved_game.user).to eq(User.find_by(uid: @data.uid))

    expect(current_path).to eq(game_friends_path(saved_game))
  end

  scenario "Attempt to Add a game with invalid data" do
    click_on("Add New Game")

    expect {
      click_on("Save")
    }.not_to change { Game.count }.by(1)

    expect(current_path).to eq "/games"
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("must be a future date")
  end

end

feature "Access restriction" do

  scenario "Attempt to Add a game without loging in" do
    visit '/games'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Please Log In")
  end

end
