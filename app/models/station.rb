class Station
  attr_reader :name, :address, :fuel_type, :distance, :name

  def initialize(params)
    @name = params[:name]
    @address = params[:address]
    @fuel_type = params[:fuel_type]
    @distance = params[:distance]
    @access_times = params[:name]
  end
end
