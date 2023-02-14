require "application_system_test_case"

class PositionTypesTest < ApplicationSystemTestCase
  setup do
    @position_type = position_types(:one)
  end

  test "visiting the index" do
    visit position_types_url
    assert_selector "h1", text: "Position Types"
  end

  test "creating a Position type" do
    visit position_types_url
    click_on "New Position Type"

    fill_in "Account", with: @position_type.account_id
    fill_in "Description", with: @position_type.description
    fill_in "Identificator", with: @position_type.identificator
    fill_in "Name", with: @position_type.name
    fill_in "Value", with: @position_type.value
    click_on "Create Position type"

    assert_text "Position type was successfully created"
    assert_selector "h1", text: "Position Types"
  end

  test "updating a Position type" do
    visit position_type_url(@position_type)
    click_on "Edit", match: :first

    fill_in "Account", with: @position_type.account_id
    fill_in "Description", with: @position_type.description
    fill_in "Identificator", with: @position_type.identificator
    fill_in "Name", with: @position_type.name
    fill_in "Value", with: @position_type.value
    click_on "Update Position type"

    assert_text "Position type was successfully updated"
    assert_selector "h1", text: "Position Types"
  end

  test "destroying a Position type" do
    visit edit_position_type_url(@position_type)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Position type was successfully destroyed"
  end
end
