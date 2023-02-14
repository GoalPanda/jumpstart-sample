require "application_system_test_case"

class PositionCategoriesTest < ApplicationSystemTestCase
  setup do
    @position_category = position_categories(:one)
  end

  test "visiting the index" do
    visit position_categories_url
    assert_selector "h1", text: "Position Categories"
  end

  test "creating a Position category" do
    visit position_categories_url
    click_on "New Position Category"

    fill_in "Account", with: @position_category.account_id
    fill_in "Description", with: @position_category.description
    fill_in "Identificator", with: @position_category.identificator
    fill_in "Name", with: @position_category.name
    fill_in "Value", with: @position_category.value
    click_on "Create Position category"

    assert_text "Position category was successfully created"
    assert_selector "h1", text: "Position Categories"
  end

  test "updating a Position category" do
    visit position_category_url(@position_category)
    click_on "Edit", match: :first

    fill_in "Account", with: @position_category.account_id
    fill_in "Description", with: @position_category.description
    fill_in "Identificator", with: @position_category.identificator
    fill_in "Name", with: @position_category.name
    fill_in "Value", with: @position_category.value
    click_on "Update Position category"

    assert_text "Position category was successfully updated"
    assert_selector "h1", text: "Position Categories"
  end

  test "destroying a Position category" do
    visit edit_position_category_url(@position_category)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Position category was successfully destroyed"
  end
end
