require 'rails_helper'

feature 'login' do
  scenario 'I can log in with a cool username' do
    visit '/users/sign_up'
    fill_in :username, with: 'awesomeLawyer'
    fill_in :email, with: 'awesome_lawyer@law.com'
    fill_in :password, with: 'iamawesome'
    fill_in :password_check, with: 'iamawesome'
    expect(page).to have_current_path('/')
    expect(page).to have_content('Welcome awesomeLawyer!')
  end
end
