require 'test_helper'

class ArmiesTest < ActionDispatch::IntegrationTest

  def setup
    @side = sides(:union)
    @army = armies(:union_army)
    @all_armies = Army.all
    @all_battles = Battle.all
    @all_events = Event.all
  end

  test 'index page' do
    get armies_path
    assert_template 'armies/index'
    @all_armies.each do |army|
      assert_select 'a[href=?]', army_path(army), text: army.name
    end
    assert_select 'a[href=?]', new_army_path, text: "Add Army"
  end

  test 'new page' do
    # Check layout
    get new_army_path
    assert_template 'armies/new'
    @all_battles.each do |battle|
      assert_select 'label', text: battle.name
    end
    @all_events.each do |event|
      assert_select 'label', text: event.name
    end

    # Check invalid new army
    assert_no_difference 'Army.count' do
      post armies_path, army: { side_id: "",
                                name: "   " }
    end
    assert_template 'armies/new'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'

    #Check valid army
    assert_difference 'Army.count', 1 do
      post armies_path, army: { side_id: @side.id,
                                name: 'New Army' }
    end
    follow_redirect!
    assert_template 'armies/show'
  end

  test 'show page' do
    # Check layout
    get army_path(@army)
    assert_template 'armies/show'

    # Check own timeline and commanders
    @army.all_events.each do |e|
      e_link = "#{e.class.to_s.downcase}_path(e)"
      assert_select 'a[href=?]', eval(e_link)
    end
    @army.commanders.each do |c|
      c_link = "#{c.class.to_s.downcase}_path(c)"
      assert_select 'a[href=?]', eval(c_link)
    end

    # Check Composition Links
    assert_select 'a[href=?]', new_battle_path(army_id: @army.id), text: 'Add Battle'
    assert_select 'a[href=?]', new_campaign_path(army_id: @army.id), text: 'Add Campaign'
  end

  test 'edit page' do
    # Check layout
    get edit_army_path(@army)
    assert_template 'armies/edit'
    @all_battles.each do |battle|
      assert_select 'label', text: battle.name
    end
    @all_events.each do |event|
      assert_select 'label', text: event.name
    end

    # Edit with invalid data
    put army_path(@army), army: { side_id: "",
                                  name: "   " }
    assert_template 'armies/edit'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'

    # Edit with valid data
    put army_path(@army), army: { side_id: @side.id,
                                  name: 'New Army' }
    follow_redirect!
    assert_template 'armies/show'
  end

end
