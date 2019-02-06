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
      distance = station[:distance]
      access_times = station[:access_days_time]
    end.first(10)
  end

  def build_address(station)
    binding.pry
  end

  def find_stations
    search_results.stations[:fuel_stations]
  end

  private

  def search_results
    @_search_results ||= search
  end

  def search
    EnergyService.new(@zip)
  end

end