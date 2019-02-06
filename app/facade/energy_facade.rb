class EnergyFacade
  def initialize(zip)
    @zip = zip
    @_search_results = nil
  end

  def stations
    search_results.stations.map do |station|

    end.first(10)
  end

  private

  def search_results
    @_search_results ||= search
  end

  def search
    EnergyService.new(@zip)
  end

end