require "test_helper"

class PositionCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @position_category = position_categories(:one)
  end

  test "should get index" do
    get position_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_position_category_url
    assert_response :success
  end

  test "should create position_category" do
    assert_difference("PositionCategory.count") do
      post position_categories_url, params: { position_category: { account_id: @position_category.account_id, description: @position_category.description, identificator: @position_category.identificator, name: @position_category.name, value: @position_category.value } }
    end

    assert_redirected_to position_category_url(PositionCategory.last)
  end

  test "should show position_category" do
    get position_category_url(@position_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_position_category_url(@position_category)
    assert_response :success
  end

  test "should update position_category" do
    patch position_category_url(@position_category), params: { position_category: { account_id: @position_category.account_id, description: @position_category.description, identificator: @position_category.identificator, name: @position_category.name, value: @position_category.value } }
    assert_redirected_to position_category_url(@position_category)
  end

  test "should destroy position_category" do
    assert_difference("PositionCategory.count", -1) do
      delete position_category_url(@position_category)
    end

    assert_redirected_to position_categories_url
  end
end
