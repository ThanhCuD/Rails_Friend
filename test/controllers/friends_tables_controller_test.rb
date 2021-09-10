require "test_helper"

class FriendsTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friends_table = friends_tables(:one)
  end

  test "should get index" do
    get friends_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_friends_table_url
    assert_response :success
  end

  test "should create friends_table" do
    assert_difference('FriendsTable.count') do
      post friends_tables_url, params: { friends_table: { email: @friends_table.email, first_name: @friends_table.first_name, last_name: @friends_table.last_name, phone: @friends_table.phone, twitter: @friends_table.twitter } }
    end

    assert_redirected_to friends_table_url(FriendsTable.last)
  end

  test "should show friends_table" do
    get friends_table_url(@friends_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_friends_table_url(@friends_table)
    assert_response :success
  end

  test "should update friends_table" do
    patch friends_table_url(@friends_table), params: { friends_table: { email: @friends_table.email, first_name: @friends_table.first_name, last_name: @friends_table.last_name, phone: @friends_table.phone, twitter: @friends_table.twitter } }
    assert_redirected_to friends_table_url(@friends_table)
  end

  test "should destroy friends_table" do
    assert_difference('FriendsTable.count', -1) do
      delete friends_table_url(@friends_table)
    end

    assert_redirected_to friends_tables_url
  end
end
