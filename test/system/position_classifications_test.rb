require "application_system_test_case"

class PositionClassificationsTest < ApplicationSystemTestCase
  setup do
    @position_classification = position_classifications(:one)
  end

  test "visiting the index" do
    visit position_classifications_url
    assert_selector "h1", text: "Position Classifications"
  end

  test "creating a Position classification" do
    visit position_classifications_url
    click_on "New Position Classification"

    fill_in "Account", with: @position_classification.account_id
    fill_in "Description", with: @position_classification.description
    fill_in "Identificator", with: @position_classification.identificator
    fill_in "Name", with: @position_classification.name
    fill_in "Value", with: @position_classification.value
    click_on "Create Position classification"

    assert_text "Position classification was successfully created"
    assert_selector "h1", text: "Position Classifications"
  end

  test "updating a Position classification" do
    visit position_classification_url(@position_classification)
    click_on "Edit", match: :first

    fill_in "Account", with: @position_classification.account_id
    fill_in "Description", with: @position_classification.description
    fill_in "Identificator", with: @position_classification.identificator
    fill_in "Name", with: @position_classification.name
    fill_in "Value", with: @position_classification.value
    click_on "Update Position classification"

    assert_text "Position classification was successfully updated"
    assert_selector "h1", text: "Position Classifications"
  end

  test "destroying a Position classification" do
    visit edit_position_classification_url(@position_classification)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Position classification was successfully destroyed"
  end
end
