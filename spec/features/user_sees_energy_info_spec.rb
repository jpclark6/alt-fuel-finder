require 'rails_helper'

describe 'as a user' do
  it 'can see electric and propane name, address, fuel type, distance and access times' do
    VCR.use_cassette("feature test 1") do
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

  it 'works on more than one zip code' do
    VCR.use_cassette("feature test 2") do
      visit '/'
      fill_in :q, with: '81507'
      click_button 'Locate'
      expect(current_path).to eq('/search')
      expect(all('.station').length).to eq(10)
      within(all('.station').first) do
        expect(page).to have_content('AmeriGas')
        expect(page).to have_content('Address: 690 Railroad Blvd, Grand Junction, CO')
        expect(page).to have_content('Fuel Types: Propane')
        expect(page).to have_content('Distance: 2.46 miles')
        expect(page).to have_content('Access Times: 7:30am-4pm M-F; must have state decal')
      end
      expect(page).to have_no_content('HY')
      expect(page).to have_no_content('Hydrogen')
      expect(page).to have_no_content('LNG')
      expect(page).to have_no_content('Natural Gas')
    end
  end
end