require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  def setup
    @location = locations(:sf)
    @charlotte = locations(:charlotte)
    @raleigh = locations(:raleigh)
    @mecklenburg = locations(:mecklenburg)
  end

  test 'should be valid' do
    assert @location.valid?
  end

  test 'state should be present' do
    @location.state = nil
    assert_not @location.valid?
  end

  test 'county should be present' do
    @location.county = nil
    assert_not @location.valid?
  end

  test 'lat and long should be present' do
    @location.lat = nil
    assert_not @location.valid?
    @location.lat = 9.99
    @location.long = nil
    assert_not @location.valid?
  end

  test 'should order by state then city' do
    assert_equal locations(:sf), Location.first
    assert_equal locations(:raleigh), Location.last
  end

  test '#coordinates should return a Hash' do
    assert_equal @location.coordinates, { lat: @location.lat, lng: @location.long }
  end

  test '#name should return location_name if present' do
    assert_equal @charlotte.name, "Queen City"
  end

  test '#name should return city & state if city is present' do
    assert_equal @raleigh.name, "Raleigh, NC"
  end

  test '#name should return county & state if city not present' do
    assert_equal @mecklenburg.name, "Mecklenburg, NC"
  end

  test '#long_name should return City, State (County) if city present' do
    assert_equal @charlotte.long_name, "Charlotte, NC (Mecklenburg)"
  end

  test '#long_name should return State (County) if city not present' do
    assert_equal @mecklenburg.long_name, "NC (Mecklenburg)"
  end

  test 'all_events should return collection object' do
    assert_equal @location.all_events.length, 7
  end

end
