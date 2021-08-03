require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include SignInHelper

  setup do
    @admin = users(:admin)
    @user = users(:user)
    sign_in_as(username: "admin", password: "P@ssw0rd1")
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { username: 'asdf', password: 'asdf', first_name: 'asdf', last_name: 'asdf', email: 'asdf@asdf.com' } }
    end

    assert_redirected_to users_url
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { username: 'asdf', password: 'asdf', first_name: 'asdf', last_name: 'asdf', email: 'asdf@asdf.com' } }
    assert_redirected_to user_url(@admin)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  test "regular user can't create users" do
    sign_in_as(username: "user", password: "passw0rd")

    get new_user_url
    assert_redirected_to user_url(@user)
  end

  test "regular user can't see other users" do
    sign_in_as(username: "user", password: "passw0rd")

    get user_url(@admin)
    assert_redirected_to user_url(@user)
  end

  test "regular user can't edit other users" do
    sign_in_as(username: "user", password: "passw0rd")

    get edit_user_url(@admin)
    assert_redirected_to user_url(@user)
  end
end
