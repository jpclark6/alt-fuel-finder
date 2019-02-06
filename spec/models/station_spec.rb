require 'rails_helper'

describe 'as a station' do
  it 'I can exist in this digital world' do
    params = {name: 'Jim', address: 'DigitalSpace', fuel_type: 'RobotTears', distance: '3nm', access_times: '24hrs/day'}
    station = Station.new(params)
    expect(station.class).to eq(Station)
  end

  it 'I have attributes that make me me' do
    name = 'Jim'
    address = 'DigitalSpace'
    fuel_type = 'RobotTears'
    distance = '3nm'
    access_times = '24 hrs/day'

    params = {name: name, address: address, fuel_type: fuel_type, distance: distance, access_times: access_times}
    station = Station.new(params)
    expect(station.name).to eq(name)
    expect(station.address).to eq(address)
    expect(station.fuel_type).to eq(fuel_type)
    expect(station.distance).to eq(distance)
    expect(station.access_times).to eq(access_times)
  end
end