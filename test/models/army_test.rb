require 'test_helper'

class ArmyTest < ActiveSupport::TestCase

  def setup
    @army = Army.new(name: "Army of the Tennessee", side_id: 1)
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

  test 'do nothing' do
    assert_not false
  end


end
