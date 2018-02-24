require 'rails_helper'

feature 'evidence feed' do
  scenario 'displays multiple statements' do
    statement_one = create(:statement, evidence: 'This is the first')
    statement_two = create(:statement, evidence: 'This is the second')
    p Statement.all
    visit '/'
    expect(page).to have_content('This is the first')
    expect(page).to have_content('This is the second')
    expect(page).to have_css('img[src*="lawyer.jpg"]')
  end
end
