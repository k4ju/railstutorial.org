require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
   def setup
    @admin = users(:michael)
   end
   
   test "layout_links as logged  in user" do
    log_in_as(@admin)
     get root_path
     assert_template "static_pages/home"
     assert_select "a[href=?]", root_path, count: 2
     assert_select "a[href=?]", help_path
     assert_select "a[href=?]", about_path
     assert_select "a[href=?]", contact_path
     assert_select "a[href=?]", users_path
     assert_select "a[href=?]", user_path(@admin)
     assert_select "a[href=?]", edit_user_path(@admin)
     assert_select "a[href=?]", logout_path
   end
   
   test 'layout links as non logged in user' do
     get root_path
     assert_template "static_pages/home"
     assert_select "a[href=?]", root_path, count: 2
     assert_select "a[href=?]", help_path
     assert_select "a[href=?]", about_path
     assert_select "a[href=?]", contact_path
     assert_select "a[href=?]", users_path, count: 0
     assert_select "a[href=?]", user_path(@admin), count: 0
     assert_select "a[href=?]", edit_user_path(@admin), count: 0
     assert_select "a[href=?]", logout_path, count: 0
     assert_select "a[href=?]", login_path
   end
end
