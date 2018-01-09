require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New User'
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Password'
  end
  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Username', with: 'jerrylau'
      fill_in 'Password', with: 'jerrylau'
      click_on 'Create User'
    end

    scenario 'shows username on the homepage after signup' do
      visit users_url
      expect(page).to have_content 'jerrylau'
    end

  end
end

feature 'logging in' do
  before(:each) do
    visit new_user_url
    fill_in 'Username', with: 'jerrylau'
    fill_in 'Password', with: 'jerrylau'
    click_on 'Create User'
  end
  scenario 'shows username on the homepage after login' do
    visit users_url
    expect(page).to have_content 'jerrylau'
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
