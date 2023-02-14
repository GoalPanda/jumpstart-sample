require "application_system_test_case"

class PositionGroupsTest < ApplicationSystemTestCase
  setup do
    @position_group = position_groups(:one)
  end

  test "visiting the index" do
    visit position_groups_url
    assert_selector "h1", text: "Position Groups"
  end

  test "creating a Position group" do
    visit position_groups_url
    click_on "New Position Group"

    fill_in "Account", with: @position_group.account_id
    fill_in "Description", with: @position_group.description
    fill_in "Identificator", with: @position_group.identificator
    fill_in "Name", with: @position_group.name
    fill_in "Value", with: @position_group.value
    click_on "Create Position group"

    assert_text "Position group was successfully created"
    assert_selector "h1", text: "Position Groups"
  end

  test "updating a Position group" do
    visit position_group_url(@position_group)
    click_on "Edit", match: :first

    fill_in "Account", with: @position_group.account_id
    fill_in "Description", with: @position_group.description
    fill_in "Identificator", with: @position_group.identificator
    fill_in "Name", with: @position_group.name
    fill_in "Value", with: @position_group.value
    click_on "Update Position group"

    assert_text "Position group was successfully updated"
    assert_selector "h1", text: "Position Groups"
  end

  test "destroying a Position group" do
    visit edit_position_group_url(@position_group)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Position group was successfully destroyed"
  end
end
