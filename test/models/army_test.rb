require 'test_helper'

class ArmyTest < ActiveSupport::TestCase

  def setup
    @army = armies(:union_army)
    @army.battles += [battles(:test_battle),battles(:test_battle_late),battles(:test_battle_early)]
    @army.events += [events(:event1), events(:event2)]
  end

  test 'should be valid' do
    assert @army.valid?
  end

  test 'side should be present' do
    @army.side = nil
    assert_not @army.valid?
  end

  test 'name should be present' do
    @army.name = '         '
    assert_not @army.valid?
  end

  test 'all_events should include events, battles, and campaigns' do
    events = @army.all_events
    assert_includes events, campaigns(:vicksburg)
    assert_includes events, battles(:test_battle_late)
    assert_includes events, events(:event2)
  end

  test "all_events should not include events/battles belonging to own army's campaign" do
    events = @army.all_events
    assert_equal events.length, 5
    refute_includes events, battles(:test_battle)
  end

  test 'all_events should be ordered by begin_date' do
    events = @army.all_events
    assert_equal events.first, battles(:test_battle_early)
  end

  test 'location_coordinates should return list of location coordinates' do
    assert_equal @army.location_coordinates.length, 5
    assert_includes @army.location_coordinates, battles(:test_battle).location.coordinates
  end

  test 'commanders should return list of players sorted by reverse begin_date' do
    assert_equal @army.commanders.length, 5
    assert_equal @army.commanders.first, players(:union5)
  end


end
