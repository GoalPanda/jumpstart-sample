require "test_helper"

class PositionGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @position_group = position_groups(:one)
  end

  test "should get index" do
    get position_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_position_group_url
    assert_response :success
  end

  test "should create position_group" do
    assert_difference("PositionGroup.count") do
      post position_groups_url, params: { position_group: { account_id: @position_group.account_id, description: @position_group.description, identificator: @position_group.identificator, name: @position_group.name, value: @position_group.value } }
    end

    assert_redirected_to position_group_url(PositionGroup.last)
  end

  test "should show position_group" do
    get position_group_url(@position_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_position_group_url(@position_group)
    assert_response :success
  end

  test "should update position_group" do
    patch position_group_url(@position_group), params: { position_group: { account_id: @position_group.account_id, description: @position_group.description, identificator: @position_group.identificator, name: @position_group.name, value: @position_group.value } }
    assert_redirected_to position_group_url(@position_group)
  end

  test "should destroy position_group" do
    assert_difference("PositionGroup.count", -1) do
      delete position_group_url(@position_group)
    end

    assert_redirected_to position_groups_url
  end
end
