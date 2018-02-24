require 'rails_helper'

feature 'login' do
  scenario 'I can log in with a cool username' do
    login('aaa@aa.com', 'awesomeLawyer')
    expect(page).to have_current_path('/')
    expect(page).to have_content('Welcome! You have joined the greatest website ever. Good move!')
  end
end
