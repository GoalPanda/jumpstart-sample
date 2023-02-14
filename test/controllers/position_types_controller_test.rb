require "test_helper"

class PositionTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @position_type = position_types(:one)
  end

  test "should get index" do
    get position_types_url
    assert_response :success
  end

  test "should get new" do
    get new_position_type_url
    assert_response :success
  end

  test "should create position_type" do
    assert_difference("PositionType.count") do
      post position_types_url, params: { position_type: { account_id: @position_type.account_id, description: @position_type.description, identificator: @position_type.identificator, name: @position_type.name, value: @position_type.value } }
    end

    assert_redirected_to position_type_url(PositionType.last)
  end

  test "should show position_type" do
    get position_type_url(@position_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_position_type_url(@position_type)
    assert_response :success
  end

  test "should update position_type" do
    patch position_type_url(@position_type), params: { position_type: { account_id: @position_type.account_id, description: @position_type.description, identificator: @position_type.identificator, name: @position_type.name, value: @position_type.value } }
    assert_redirected_to position_type_url(@position_type)
  end

  test "should destroy position_type" do
    assert_difference("PositionType.count", -1) do
      delete position_type_url(@position_type)
    end

    assert_redirected_to position_types_url
  end
end
