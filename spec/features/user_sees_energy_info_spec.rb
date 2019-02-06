require 'rails_helper'

describe 'as a user' do
  it 'can see electric and propane name, address, fuel type, distance and access times' do
    visit '/'
    fill_in :q, with: '80203'
    click_button 'Locate'
    expect(current_path).to eq('/search')
    expect(all('.station').length).to eq(10)
    within(all('.station').first) do
      expect(page).to have_content('UDR')
      expect(page).to have_content('Address: 800 Acoma St, Denver, CO')
      expect(page).to have_content('Fuel Types: Electric')
      expect(page).to have_content('Distance: 0.31 miles')
      expect(page).to have_content('Access Times: 24 hours daily')
    end
    expect(page).to have_no_content('HY')
    expect(page).to have_no_content('Hydrogen')
    expect(page).to have_no_content('LNG')
    expect(page).to have_no_content('Natural Gas')
  end
end

# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times