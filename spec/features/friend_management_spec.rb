require 'spec_helper.rb'

feature 'Friend management' do

  background do
    visit '/'
    @data = auth_data

    sign_in_with_facebook @data

    @game = create(:game)
    @game.user = User.find_by(uid: @data.uid)
    @game.save

    visit game_friends_path(@game)

  end

  scenario 'Adding a non existing friend to a game' do

    click_on('Add a friend')

    fill_in 'invitation_manager[name]', with: "Tony Stark"
    fill_in 'invitation_manager[email]', with: "tony@starkinc.com"

    clear_emails
    expect { click_on('Add to Game') }.to change { @game.friends.count }.by(1)

    open_email("tony@starkinc.com")
    current_email.should have_content(@game.name)
    current_email.should have_content(@game.user.name)

    expect(current_path).to eq game_friends_path(@game)

    expect(page).to have_content "User Tony Stark (tony@starkinc.com) invited to the game"

  end

  scenario 'Adding an existing friend to a game' do

    # ya creado antes
    friend = create(:user)

    click_on('Add a friend')

    fill_in 'invitation_manager[name]', with: friend.name
    fill_in 'invitation_manager[email]', with: friend.email

    clear_emails
    expect { click_on('Add to Game') }.to change { @game.friends.count }.by(1)

    open_email(friend.email)
    current_email.should have_content(@game.name)
    current_email.should have_content(@game.user.name)

    expect(current_path).to eq game_friends_path(@game)

    expect(page).to have_content "User #{friend.name} (#{friend.email}) invited to the game"

  end

  scenario 'Adding a friend to a game with invalid data' do

     click_on('Add a friend')
     click_on('Add to Game')

     expect(current_path).to eq game_friends_path(@game)

     expect(page).to have_content "Name can't be blank"
     expect(page).to have_content "Email can't be blank"


  end

end
