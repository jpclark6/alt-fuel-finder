class EnergyFacade
  def initialize(zip)
    @zip = zip
    @_search_results = nil
  end

  def stations
    find_stations.map do |station|
      binding.pry
      name = station[:station_name]
      address = 
      fuel_type =
      distance = 
      access_times = 

    end.first(10)
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