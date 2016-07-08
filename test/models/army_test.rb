require 'test_helper'

class ArmyTest < ActiveSupport::TestCase

  def setup
    @army = armies(:union_army)
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

end
