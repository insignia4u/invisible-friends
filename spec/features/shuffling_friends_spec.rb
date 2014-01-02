require 'spec_helper.rb'

feature "Friends shuffle" do

  background do
    visit '/'
    @data= auth_data
    sign_in_with_facebook @data

    @game = create(:game)

    for i in 0..5
      @friend = create(:friend)
      @game.friends << @friend
      User.find_by(uid: @data.uid).games << @game
    end
    visit '/'

  end

  scenario "shuffles friends of a game" do
    clear_emails

    click_on("Shuffle")

    expect(page).to have_content("Invitations sent")

    open_email(@game.friends.last.email)

    current_email.should have_content(@game.name)

  end

  scenario "resends invitations to game's friends" do
    click_on("Shuffle")

    clear_emails

    click_on("Resend")

    expect(page).to have_content("Invitations sent")

    open_email(@game.friends.last.email)

    current_email.should have_content(@game.name)

  end

end
