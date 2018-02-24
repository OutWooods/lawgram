require 'rails_helper'

feature 'login' do
  scenario 'I can log in with a cool username' do
    login('aaa@aa.com', 'awesomeLawyer')
    expect(page).to have_current_path('/')
    expect(page).to have_content('Welcome! You have joined the greatest website ever. Good move!')
  end

  scenario 'I can\'t login with a username shorter than 4' do
    login('aaa@aa.com', 'sht')
    expect(page).to have_current_path('/users')
    expect(page).to_not have_content('Welcome! You have joined the greatest website ever. Good move!')
    expect(page).to have_content('User nameis too short (minimum is 4 characters) ')
  end
end
