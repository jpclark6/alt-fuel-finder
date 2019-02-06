require 'rails_helper'

describe 'as a facade' do
  it 'exists' do
    VCR.use_cassette("facade exists") do
      zip = 80203
      facade = EnergyFacade.new(zip)
      expect(facade.class).to eq(EnergyFacade)
    end
  end

  it 'can build addresses correctly' do
    VCR.use_cassette("facade builds address") do
      zip = 80203
      facade = EnergyFacade.new(zip)
      service = EnergyService.new(zip).station_data
      station = service[:fuel_stations].first
      expect(facade.build_address(station)).to eq('800 Acoma St, Denver, CO')
    end
  end

  it 'can find real name for fuel' do
    VCR.use_cassette("facade finds fuel") do
      zip = 80203
      facade = EnergyFacade.new(zip)
      service = EnergyService.new(zip).station_data
      station = service[:fuel_stations].first
      expect(facade.find_fuel(station)).to eq('Electric')
    end
  end

  it 'limits search results to 10 stations' do
    VCR.use_cassette("facade limits stations") do
      zip = 80203
      facade = EnergyFacade.new(zip)
      expect(facade.stations.length).to eq(10)
    end
  end
end
