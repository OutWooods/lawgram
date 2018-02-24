require 'rails_helper.rb'

feature 'Creating statements' do
  scenario 'can create a statement' do
    visit '/'
    click_link 'New Statement'
    attach_file('statement[image]', 'spec/files/images/lawyer.jpg')
    fill_in 'Evidence', with: 'I am a big clever lawyer'
    click_button 'Create Statement'
    expect(page).to have_content('clever lawyer')
    expect(page).to have_css('img[src*="lawyer.jpg"]')
  end
end
