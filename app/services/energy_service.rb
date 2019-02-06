class EnergyService
  def initialize(zip)
    @zip = zip
    @_search_results = nil
  end

  def stations
    get_json("/api/alt-fuel-stations/v1/nearest?api_key=#{ENV['API_KEY']}&format=json&location=#{@zip}&radius=6&fuel_type=ELEC,LPG")
  end

  private

  def conn
    Faraday.new(url: https://developer.nrel.gov) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
