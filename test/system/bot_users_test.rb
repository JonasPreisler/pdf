require "application_system_test_case"

class BotUsersTest < ApplicationSystemTestCase
  setup do
    @bot_user = bot_users(:one)
  end

  test "visiting the index" do
    visit bot_users_url
    assert_selector "h1", text: "Bot Users"
  end

  test "creating a Bot user" do
    visit bot_users_url
    click_on "New Bot User"

    fill_in "First Name", with: @bot_user.first_name
    click_on "Create Bot user"

    assert_text "Bot user was successfully created"
    click_on "Back"
  end

  test "updating a Bot user" do
    visit bot_users_url
    click_on "Edit", match: :first

    fill_in "First Name", with: @bot_user.first_name
    click_on "Update Bot user"

    assert_text "Bot user was successfully updated"
    click_on "Back"
  end

  test "destroying a Bot user" do
    visit bot_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bot user was successfully destroyed"
  end
end
