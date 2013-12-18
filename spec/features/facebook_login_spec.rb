require 'spec_helper.rb'

feature "Facebook Login" do
  given(:valid_oauth) { auth_data }
  given(:invalid_oauth) { auth_data(false) }

  background do
    visit "/"
  end

  scenario "signing in with a valid account" do
    sign_in_with_facebook(valid_oauth)

    expect(User.where(email: valid_oauth.info.email)).to exist
    expect(current_path).to eq root_path
    expect(page).to have_content valid_oauth.info.name
    expect(page).to have_content "You're logged in."
    expect(page).to have_content 'Sign Out'
    expect(page).not_to have_content 'Sign in with Facebook'
  end

  scenario "signing in with an invalid account" do
    expect {
      sign_in_with_facebook(invalid_oauth)
    }.not_to change { User.count }.by(1)
    expect(page).to have_content "We couldn't sign you in."
  end

  scenario "signing out" do
    sign_in_with_facebook(valid_oauth)

    click_on 'Sign Out'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Sign in with Facebook'
    expect(page).not_to have_content 'Sign Out'
  end

end
