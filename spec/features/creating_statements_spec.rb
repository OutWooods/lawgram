require 'rails_helper.rb'

feature 'Creating statements' do
  background do
    visit '/'
    click_link 'New Statement'
  end

  scenario 'can create a statement' do
    attach_file('statement[image]', 'spec/files/images/lawyer.jpg')
    fill_in 'Evidence', with: 'I am a big clever lawyer'
    click_button 'Create Statement'
    expect(page).to have_content('clever lawyer')
    expect(page).to have_css('img[src*="lawyer.jpg"]')
  end


  scenario 'can\'t post without an image' do
    fill_in 'Evidence', with: 'I am a silly lawyer'
    click_button 'Create Statement'
    expect(page).to have_content('No no, you silly lawyer...you need an image')
  end
end
