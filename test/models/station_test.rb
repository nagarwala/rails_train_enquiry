# frozen_string_literal: true

require 'test_helper'

class StationTest < ActiveSupport::TestCase
  def setup
    @station = Station.new(name: 'Jalpaiguri Road Station', location: 'Jalpaiguri')
  end

  test 'station should be valid' do
    assert @station.valid?
  end

  test 'station name should be present' do
    @station.name = ' '
    assert_not @station.valid?
  end

  test 'station location should be present' do
    @station.location = ' '
    assert_not @station.valid?
  end

  test 'station name should be unique' do
    @station.save
    @station2 = Station.new(name: 'Jalpaiguri Road Station', location: 'Jalpaiguri')
    assert_not @station2.valid?
  end

  test 'station name should be minimum 6 letters' do
    @station.name = 'aaaaa'
    assert_not @station.valid?
  end
end
