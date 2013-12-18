require 'spec_helper.rb'

feature "Sign in with Facebook" do
  
  scenario "Successful login" do
    visit "/"

    authenticate_user

    expect(User.all).not_to be_empty
    expect(current_path).to eq root_path
    expect(page).to have_content auth_data(true).info.name
    expect(page).to have_content 'Sign Out'

  end

end

feature "Sign Out" do

  scenario do
    visit "/"

    authenticate_user

    click_on 'Sign Out'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Sign in with Facebook'
  end

end

