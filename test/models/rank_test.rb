require 'test_helper'

class RankTest < ActiveSupport::TestCase

  def setup
    @rank = ranks(:rank_grant)
    @rank_late = ranks(:rank6)
    armies(:union_army).events += [events(:event1),events(:eventLate),events(:eventGrant)]
    armies(:union_army).battles += [battles(:test_battle_grant), battles(:test_battle_late)]
  end

  test 'should be valid' do
    assert @rank.valid?
  end

  test 'begin_date should be present' do
    @rank.begin_date = nil
    assert_not @rank.valid?
  end

  test 'player_id should be present' do
    @rank.player_id = nil
    assert_not @rank.valid?
  end

  test 'army_id should be present' do
    @rank.army_id = nil
    assert_not @rank.valid?
  end

  test 'belongs to player' do
    assert_equal @rank.player, players(:grant)
  end

  test 'belongs to army' do
    assert_equal @rank.army, armies(:union_army)
  end

  test 'should have many events' do
    assert_equal 2, @rank.events.length
    assert_equal 1, @rank_late.events.length
  end

  test 'should have many battles' do
    assert_equal 1, @rank.battles.length
    assert_equal 1, @rank_late.battles.length
  end

  test 'should have many campaigns' do
    assert_equal 1, @rank.campaigns.length
    assert_equal 1, @rank_late.campaigns.length
  end

  test 'all_events should include events, battles, and campaigns' do
    events = @rank.all_events
    assert_includes events, campaigns(:vicksburg)
    assert_includes events, battles(:test_battle_grant)
    assert_includes events, events(:eventGrant)
  end

  test "all_events should not include events/battles belonging to rank's own army's campaign" do
    events = @rank.all_events
    assert_equal 3, events.length
    refute_includes events, battles(:test_battle)
  end

  test 'all_events should order by begin_date' do
    assert_equal battles(:test_battle_grant), @rank.all_events.first
  end

  test 'order should be most recent first' do
    assert_equal ranks(:rank6), Rank.first
  end

end
