require "application_system_test_case"

class FriendsTablesTest < ApplicationSystemTestCase
  setup do
    @friends_table = friends_tables(:one)
  end

  test "visiting the index" do
    visit friends_tables_url
    assert_selector "h1", text: "Friends Tables"
  end

  test "creating a Friends table" do
    visit friends_tables_url
    click_on "New Friends Table"

    fill_in "Email", with: @friends_table.email
    fill_in "First name", with: @friends_table.first_name
    fill_in "Last name", with: @friends_table.last_name
    fill_in "Phone", with: @friends_table.phone
    fill_in "Twitter", with: @friends_table.twitter
    click_on "Create Friends table"

    assert_text "Friends table was successfully created"
    click_on "Back"
  end

  test "updating a Friends table" do
    visit friends_tables_url
    click_on "Edit", match: :first

    fill_in "Email", with: @friends_table.email
    fill_in "First name", with: @friends_table.first_name
    fill_in "Last name", with: @friends_table.last_name
    fill_in "Phone", with: @friends_table.phone
    fill_in "Twitter", with: @friends_table.twitter
    click_on "Update Friends table"

    assert_text "Friends table was successfully updated"
    click_on "Back"
  end

  test "destroying a Friends table" do
    visit friends_tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friends table was successfully destroyed"
  end
end
