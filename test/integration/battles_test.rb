require 'test_helper'

class BattlesTest < ActionDispatch::IntegrationTest

  def setup
    @battle = battles(:test_battle)
    @battle.armies << armies(:union_army)
    @all_armies = Army.all
    @all_battles = Battle.all
    @all_locations = Location.all
    @all_sides = Side.all
    @all_campaigns = Campaign.all
  end

  test 'index page' do
    get battles_path
    assert_template 'battles/index'
    @all_battles.each do |battle|
      assert_select 'a[href=?]', battle_path(battle)
    end
    assert_select 'a[href=?]', new_battle_path, text: 'Add Battle'
  end

  test 'new page' do
    # Check layout
    get new_battle_path
    assert_template 'battles/new'
    @all_armies.each do |army|
      assert_select 'label', text: army.name
    end
    @all_locations.each do |location|
      assert_select 'option', text: location.name
    end
    @all_sides.each do |side|
      assert_select 'label', text: side.name
    end
    @all_campaigns.each do |campaign|
      assert_select 'option', text: campaign.name
    end

    # Check invalid battle
    assert_no_difference 'Battle.count' do
      post battles_path, battle: { side_id:     ' ',
                                   name:        ' ',
                                   begin_date:  ' ',
                                   end_date:    ' ',
                                   location_id: ' ',
                                   victor_id:   ' ',
                                   campaign_id: ' ',
                                   conclusion:  ' ',
                                   description: ' ', }
    end
    assert_template 'battles/new'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'

    # Check valid battle
    assert_difference 'Battle.count' do
      post battles_path, battle: {  name:        'New Battle',
                                    begin_date:  '2015-02-01',
                                    end_date:    '2015-02-03',
                                    location_id: locations(:sf).id,
                                    victor_id:   sides(:union).id,
                                    campaign_id: campaigns(:vicksburg).id,
                                    conclusion:  'Retreat',
                                    description: 'Valid Battle description', }
    end
    follow_redirect!
    assert_template 'battles/show'
  end

test 'show page' do
  # Check layout
  get battle_path(@battle)
  assert_template 'battles/show'
  @battle.armies.each do |army|
    assert_select 'a[href=?]', army_path(army), text: army.name
  end

  # Check edit link
  assert_select 'a[href=?]', edit_battle_path(@battle)

  # Check delete link
  assert_select 'a[href=?]', battle_path(@battle), method: :delete
  assert_difference 'Battle.count', -1 do
    delete battle_path(@battle)
  end
  follow_redirect!
  assert_template 'static_pages/engagements'
end

  test 'edit page' do
    # Check layout
    get edit_battle_path(@battle)
    assert_template 'battles/edit'
    @all_armies.each do |army|
      assert_select 'label', text: army.name
    end
    @all_locations.each do |location|
      assert_select 'option', text: location.name
    end
    @all_sides.each do |side|
      assert_select 'label', text: side.name
    end
    @all_campaigns.each do |campaign|
      assert_select 'option', text: campaign.name
    end

    # Check invalid battle
    assert_no_difference 'Battle.count' do
      put battle_path(@battle), battle: { side_id:     ' ',
                                          name:        ' ',
                                          begin_date:  ' ',
                                          end_date:    ' ',
                                          location_id: ' ',
                                          victor_id:   ' ',
                                          campaign_id: ' ',
                                          conclusion:  ' ',
                                          description: ' ', }
    end
    assert_template 'battles/edit'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'

    # Check valid battle
    put battle_path(@battle), battle: { name:        'New Battle',
                                        begin_date:  '2015-02-01',
                                        end_date:    '2015-02-03',
                                        location_id: locations(:sf).id,
                                        victor_id:   sides(:union).id,
                                        campaign_id: campaigns(:vicksburg).id,
                                        conclusion:  'Retreat',
                                        description: 'Valid Battle description', }
    follow_redirect!
    assert_template 'battles/show'
  end

end
