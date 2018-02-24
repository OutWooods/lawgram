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
end
