require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", armies_path
    assert_select "a[href=?]", players_path
    assert_select "a[href=?]", engagements_url
    assert_select "a[href=?]", locations_path
    assert_select "a[href=?]", campaigns_path
    assert_select "a[href=?]", battles_path
    assert_select "a[href=?]", events_path
    assert_select "title", "Civil War Tracker"
  end

end
