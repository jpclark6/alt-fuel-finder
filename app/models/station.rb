class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(params)
    @name = params[:name]
    @address = params[:address]
    @fuel_type = params[:fuel_type]
    @distance = params[:distance]
    @access_times = params[:access_times]
  end
end
