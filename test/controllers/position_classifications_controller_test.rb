require "test_helper"

class PositionClassificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @position_classification = position_classifications(:one)
  end

  test "should get index" do
    get position_classifications_url
    assert_response :success
  end

  test "should get new" do
    get new_position_classification_url
    assert_response :success
  end

  test "should create position_classification" do
    assert_difference("PositionClassification.count") do
      post position_classifications_url, params: { position_classification: { account_id: @position_classification.account_id, description: @position_classification.description, identificator: @position_classification.identificator, name: @position_classification.name, value: @position_classification.value } }
    end

    assert_redirected_to position_classification_url(PositionClassification.last)
  end

  test "should show position_classification" do
    get position_classification_url(@position_classification)
    assert_response :success
  end

  test "should get edit" do
    get edit_position_classification_url(@position_classification)
    assert_response :success
  end

  test "should update position_classification" do
    patch position_classification_url(@position_classification), params: { position_classification: { account_id: @position_classification.account_id, description: @position_classification.description, identificator: @position_classification.identificator, name: @position_classification.name, value: @position_classification.value } }
    assert_redirected_to position_classification_url(@position_classification)
  end

  test "should destroy position_classification" do
    assert_difference("PositionClassification.count", -1) do
      delete position_classification_url(@position_classification)
    end

    assert_redirected_to position_classifications_url
  end
end
