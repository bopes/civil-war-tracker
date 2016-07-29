require 'test_helper'

class SideTest < ActiveSupport::TestCase

  def setup
    @side = sides(:union)
  end

  test 'should have many armies' do
    assert_equal @side.armies.length, 1
    assert_includes @side.armies, armies(:union_army)
  end

  test 'should have many campaigns' do
    assert_equal @side.campaigns.length, 2
    assert_includes @side.campaigns, campaigns(:vicksburg)
  end

  test 'should have many players' do
    assert_equal @side.players.length, 5
    assert_includes @side.players, players(:grant)
  end

  test 'should have many victories' do
    assert_equal @side.victories.length, 3
    assert_includes @side.victories, battles(:test_battle)
  end

end
