require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @event = events(:event1)
    @event.armies << armies(:union_army)
  end

  test 'should be valid' do
    assert @event.valid?
  end

  test 'begin_date should be valid' do
    @event.begin_date = nil
    assert_not @event.valid?
  end

  test 'location_id should be valid' do
    @event.location_id = nil
    assert_not @event.valid?
  end

  test 'may have campaign' do
    assert_equal @event.campaign, campaigns(:vicksburg)
    assert_nil events(:event2).campaign
  end

  test 'should have location' do
    assert_equal @event.location, locations(:sf)
  end

  test 'should have array of armies' do
    assert_equal @event.armies.length, 1
    assert_includes @event.armies, armies(:union_army)
  end

  test '#location_coordinates should return array of coordinates' do
    assert_instance_of Array, @event.location_coordinates
    assert_equal @event.location_coordinates.length, 1
    assert_includes @event.location_coordinates, @event.location.coordinates
  end

  test 'should be in order by begin_date' do
    assert_equal events(:event3), Event.first
  end

end
