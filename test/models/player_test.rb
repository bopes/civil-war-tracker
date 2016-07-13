require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  def setup
    @player = players(:grant)
    @army = armies(:union_army)
    @other_army = armies(:confederate_army)
    @army.battles << battles(:test_battle_grant)
    @army.events << events(:eventGrant)
  end

  test 'should be valid' do
    assert @player.valid?
  end

  test 'should have name' do
    @player.name = nil
    assert_not @player.valid?
  end

  test 'should have bio' do
    @player.bio = nil
    assert_not @player.valid?
  end

  test 'should have side' do
    @player.side = nil
    assert_not @player.valid?
  end

  test 'should have many ranks' do
    assert_equal 1, @player.ranks.length
    assert_instance_of Rank, @player.ranks.first
  end

  test 'should be ordered by name' do
    assert_equal players(:lee), Player.first
  end

  test 'should have many battles' do
    assert_equal 1, @player.battles.length
    assert_instance_of Battle, @player.battles.first
  end

  test 'should have many events' do
    assert_equal 1, @player.events.length
    assert_instance_of Event, @player.events.first
  end

  test 'should have many campaigns' do
    assert_equal 1, @player.campaigns.length
    assert_instance_of Campaign, @player.campaigns.first
  end

  test 'all_events should include events, battles, and campaigns' do
    events = @player.all_events
    assert_includes events, campaigns(:vicksburg)
    assert_includes events, battles(:test_battle_grant)
    assert_includes events, events(:eventGrant)
  end

  test "all_events should not include events/battles belonging to rank's own army's campaign" do
    events = @player.all_events
    assert_equal 3, events.length
    refute_includes events, battles(:test_battle)
  end

  test 'location_coordinates should return list of location coordinates' do
    assert_equal 2, @player.location_coordinates.length
    assert_includes @player.location_coordinates, battles(:test_battle_grant).location.coordinates
  end

  test 'ranks_with should return a list of ranks with a given army' do
    assert_equal 1, @player.ranks_with(@army).length
    assert_instance_of Rank, @player.ranks_with(@army).first
    assert_equal 0, @player.ranks_with(@other_army).length
  end

end
