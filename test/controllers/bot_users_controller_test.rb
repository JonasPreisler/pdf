require 'test_helper'

class BotUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bot_user = bot_users(:one)
  end

  test "should get index" do
    get bot_users_url
    assert_response :success
  end

  test "should get new" do
    get new_bot_user_url
    assert_response :success
  end

  test "should create bot_user" do
    assert_difference('BotUser.count') do
      post bot_users_url, params: { bot_user: { first_name: @bot_user.first_name } }
    end

    assert_redirected_to bot_user_url(BotUser.last)
  end

  test "should show bot_user" do
    get bot_user_url(@bot_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_bot_user_url(@bot_user)
    assert_response :success
  end

  test "should update bot_user" do
    patch bot_user_url(@bot_user), params: { bot_user: { first_name: @bot_user.first_name } }
    assert_redirected_to bot_user_url(@bot_user)
  end

  test "should destroy bot_user" do
    assert_difference('BotUser.count', -1) do
      delete bot_user_url(@bot_user)
    end

    assert_redirected_to bot_users_url
  end
end
