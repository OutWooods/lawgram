require 'rails_helper'

feature 'login' do
  scenario 'I can log in with a cool username' do
    visit '/users/sign_up'
    fill_in 'User name', with: 'awesomeLawyer'
    fill_in :Email, with: 'awesome_lawyer@law.com'
    fill_in 'user[password]', with: 'iamawesome'
    fill_in 'Password confirmation', with: 'iamawesome'
    click_button 'Sign up'
    expect(page).to have_current_path('/')
    expect(page).to have_content('Welcome awesome Lawyer!')
  end
end
