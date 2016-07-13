require 'test_helper'

class CampaignTest < ActiveSupport::TestCase

  def setup
    @campaign = campaigns(:vicksburg)
    @campaign.battles << battles(:test_battle)
    @campaign.events << events(:event1)
  end

  test 'should be valid' do
    assert @campaign.valid?
  end

  test 'should have begin_date' do
    @campaign.begin_date = nil
    assert_not @campaign.valid?
  end

  test 'should have army_id' do
    @campaign.army_id = nil
    assert_not @campaign.valid?
  end

  test 'should belong to one army' do
    assert_equal @campaign.army, armies(:union_army)
  end

  test 'should have many battles' do
    assert_equal @campaign.battles.length, 1
    assert_includes @campaign.battles, battles(:test_battle)
  end

  test 'should have many events' do
    assert_equal @campaign.events.length, 1
    assert_includes @campaign.events, events(:event1)
  end

  test 'should have side' do
    assert_equal @campaign.side, sides(:union)
  end

  test 'all_events should combine battles and events by begin_date' do
    assert_equal @campaign.all_events.length, 2
    assert_includes @campaign.all_events, battles(:test_battle)
    assert_includes @campaign.all_events, events(:event1)
    assert_equal @campaign.all_events.first, events(:event1)
  end

  test 'location_coordinates should include battles and events' do
    assert_equal @campaign.location_coordinates.length, 2
    assert_includes @campaign.location_coordinates, battles(:test_battle).location.coordinates
    assert_includes @campaign.location_coordinates, events(:event1).location.coordinates
  end

  test 'commanders should return only ranks who overlap campaign' do
    assert_includes @campaign.commanders, ranks(:rank_grant)
    refute_includes @campaign.commanders, ranks(:rank2)
    assert_includes @campaign.commanders, ranks(:rank3)
    assert_includes @campaign.commanders, ranks(:rank4)
    refute_includes @campaign.commanders, ranks(:rank5)
  end

  test 'order should be by begin date' do
    assert_equal Campaign.last, campaigns(:late_campaign)
  end

end
