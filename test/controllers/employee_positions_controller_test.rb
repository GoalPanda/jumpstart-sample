require 'test_helper'

class EmployeePositionsControllerTest < ActionController::TestCase
  setup do
    @position_group = position_groups(:one)
    @employee_position = employee_positions(:one)
  end

  test "should get index" do
    get :index, params: { position_group_id: @position_group }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { position_group_id: @position_group }
    assert_response :success
  end

  test "should create employee_position" do
    assert_difference('EmployeePosition.count') do
      post :create, params: { position_group_id: @position_group, employee_position: @employee_position.attributes }
    end

    assert_redirected_to position_group_employee_position_path(@position_group, EmployeePosition.last)
  end

  test "should show employee_position" do
    get :show, params: { position_group_id: @position_group, id: @employee_position }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { position_group_id: @position_group, id: @employee_position }
    assert_response :success
  end

  test "should update employee_position" do
    put :update, params: { position_group_id: @position_group, id: @employee_position, employee_position: @employee_position.attributes }
    assert_redirected_to position_group_employee_position_path(@position_group, EmployeePosition.last)
  end

  test "should destroy employee_position" do
    assert_difference('EmployeePosition.count', -1) do
      delete :destroy, params: { position_group_id: @position_group, id: @employee_position }
    end

    assert_redirected_to position_group_employee_positions_path(@position_group)
  end
end
