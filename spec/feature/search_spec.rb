require 'rails_helper'

RSpec.feature 'search and view' do
  scenario 'successful search and view', :vcr do
    visit '/'
    fill_in 'keyword', with: 'cats'
    click_button 'Search'

    expect(page.all('img').size).to eq(100)

    # follow the first result link
    first('.search-result-item a').click
    expect(page).to have_content('Image title')
    expect(page).to have_content('Description')
  end
end
