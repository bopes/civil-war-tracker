require 'test_helper'

class BattleTest < ActiveSupport::TestCase

  def setup
    @battle = battles(:test_battle)
  end

  test 'should be valid' do
    assert @battle.valid?
  end

  test 'location should be present' do
    @battle.location = nil
    assert_not @battle.valid?
  end

  test 'name should be present' do
    @battle.victor = nil
    assert_not @battle.valid?
  end

end
