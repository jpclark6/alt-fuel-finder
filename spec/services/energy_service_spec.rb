require 'rails_helper'

describe 'as a service' do
  it 'exists' do
    zip = 80004
    service = EnergyService.new(zip)
    expect(service.class).to eq(EnergyService)
  end
end