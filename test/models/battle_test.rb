require 'test_helper'

class BattleTest < ActiveSupport::TestCase

  def setup
    @battle = battles(:test_battle)
    @battle.armies << armies(:union_army)
  end

  test 'should be valid' do
    assert @battle.valid?
  end

  test 'begin_date should be present' do
    @battle.begin_date = nil
    assert_not @battle.valid?
  end

  test 'location should be present' do
    @battle.location = nil
    assert_not @battle.valid?
  end

  test 'victor should be present' do
    @battle.victor = nil
    assert_not @battle.valid?
  end

  test 'should have a list of armies' do
    assert_equal @battle.armies.length, 1
    assert_includes @battle.armies, armies(:union_army)
  end

  test '#location_coordinates should return array of locations' do
    assert_equal @battle.location_coordinates.length, 1
    assert_includes @battle.location_coordinates, @battle.location.coordinates
  end

  test 'order should be by begin date' do
    assert_equal battles(:test_battle_early), Battle.first
  end

end
