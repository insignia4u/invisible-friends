require 'spec_helper.rb'

feature "Friends shuffle" do

  background do
    visit '/'
    @data= auth_data
    sign_in_with_facebook @data
  end

  scenario "shuffles friends of a game" do
    game = create(:game)

    for i in 0..5
      @friend = create(:friend)
      game.friends << @friend
      User.find_by(uid: @data.uid).games << game
    end
    visit '/'

    clear_emails

    click_on("Shuffle")

    expect(page).to have_content("Invitations sent")

    open_email(game.friends.last.email)

    current_email.should have_content(game.name)

  end
end
