require 'rails_helper'

RSpec.feature 'search and view' do
  scenario 'successful search and view', :vcr do
    visit '/'
    fill_in 'flickr_search_form[keyword]', with: 'cats'
    click_button 'Search'

    expect(page.all('img').size).to eq(100)

    first('a').click

    expect(page).to have_content('Image title')
    expect(page).to have_content('Description')
  end
end
