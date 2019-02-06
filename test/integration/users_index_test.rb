require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:michael)
    @non_admin = users(:archer)
    @not_activated_user = users(:lana)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'Delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end    
  end

  test "index as non_admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'Delete', count: 0
  end

  test "index not accessible as not_activated user" do
    log_in_as(@not_activated_user)
    assert_redirected_to root_url
    assert_not flash.empty?
    get users_path
    assert_redirected_to login_url
  end

  test "index accessible as activated user" do
    log_in_as(@non_admin)
    assert_redirected_to user_path(@non_admin)
    assert flash.empty?
  end

end
