require 'rails_helper'

describe 'as a service' do
  it 'exists' do
    zip = 80203
    service = EnergyService.new(zip)
    expect(service.class).to eq(EnergyService)
  end

  it 'has required attributes present for stations' do
    zip = 80203
    service = EnergyService.new(zip).station_data

    expect(service.class).to eq(Hash)
    expect(service[:fuel_stations].length).to eq(20)
    expect(service[:fuel_stations][0].keys).to include(:station_name)
    expect(service[:fuel_stations][0].keys).to include(:street_address)
    expect(service[:fuel_stations][0].keys).to include(:city)
    expect(service[:fuel_stations][0].keys).to include(:state)
    expect(service[:fuel_stations][0].keys).to include(:fuel_type_code)
    expect(service[:fuel_stations][0].keys).to include(:distance)
    expect(service[:fuel_stations][0].keys).to include(:access_days_time)
  end
end