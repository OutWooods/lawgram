require 'rails_helper'

feature 'evidence feed' do
   background do
     statement_one = create(:statement, evidence: 'This is the first')
     statement_two = create(:statement, evidence: 'This is the second')
     visit '/'
   end

  scenario 'displays multiple statements' do
    expect(page).to have_content('This is the first')
    expect(page).to have_content('This is the second')
    expect(page).to have_css('img[src*="lawyer.jpg"]')
  end

  scenario 'visit an individual statement' do
     page.all(:link, "See evidence")[1].click
     expect(page).not_to have_content('This is the first')
     expect(page).to have_content('This is the second')
     expect(page).to have_css('img[src*="lawyer.jpg"]')
  end

  scenario 'edit a file' do
    page.all(:link, "Tamper")[1].click
    fill_in :capiton, with: 'Ouch...this is not good'
    click_button 'Permanently change'
    expect(page).to have_content('Evidence changed mate')
    expect(page).to have_content('Ouch...this is not good')
    expect(page).not_to have_content('This is the second')
    expect(page).to have_css('img[src*="lawyer.jpg"]')
  end
end
