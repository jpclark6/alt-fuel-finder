class EnergyFacade
  def initialize(zip)
    @zip = zip
    @_search_results = nil
  end

  def stations
    find_stations.map do |station|
      name = station[:station_name]
      address = build_address(station)
      fuel_type = find_fuel(station)
      distance = station[:distance].round(2)
      access_times = station[:access_days_time]
      params = {name: name, 
                address: address, 
                fuel_type: fuel_type, 
                distance: distance,
                access_times: access_times
              }
      Station.new(params)
    end.first(10)
  end

  def build_address(station)
    street_address = station[:street_address]
    city = station[:city]
    state = station[:state]
    "#{street_address}, #{city}, #{state}"
  end

  def find_fuel(station)
    fuel_type = station[:fuel_type_code]
    fuel_name[fuel_type]
  end

  def fuel_name
    {'ELEC' => "Electric", 'LPG' => 'Propane'}
  end

  def find_stations
    search_results.station_data[:fuel_stations]
  end

  private

  def search_results
    @_search_results ||= search
  end

  def search
    EnergyService.new(@zip)
  end
end