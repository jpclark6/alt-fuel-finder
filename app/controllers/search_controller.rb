class SearchController < ApplicationController
  def index
    @facade = EnergyFacade.new(params[:q])
  end
end