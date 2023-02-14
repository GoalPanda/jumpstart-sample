require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @activity = activities(:one)
  end

  test "visiting the index" do
    visit activities_url
    assert_selector "h1", text: "Activities"
  end

  test "creating a Activity" do
    visit activities_url
    click_on "New Activity"

    fill_in "Budget", with: @activity.budget
    fill_in "Code", with: @activity.code
    fill_in "Color", with: @activity.color
    fill_in "Component", with: @activity.component_id
    fill_in "Description", with: @activity.description
    fill_in "Flag", with: @activity.flag
    fill_in "Name", with: @activity.name
    fill_in "Parent", with: @activity.parent_id
    fill_in "Status", with: @activity.status
    fill_in "User", with: @activity.user_id
    click_on "Create Activity"

    assert_text "Activity was successfully created"
    assert_selector "h1", text: "Activities"
  end

  test "updating a Activity" do
    visit activity_url(@activity)
    click_on "Edit", match: :first

    fill_in "Budget", with: @activity.budget
    fill_in "Code", with: @activity.code
    fill_in "Color", with: @activity.color
    fill_in "Component", with: @activity.component_id
    fill_in "Description", with: @activity.description
    fill_in "Flag", with: @activity.flag
    fill_in "Name", with: @activity.name
    fill_in "Parent", with: @activity.parent_id
    fill_in "Status", with: @activity.status
    fill_in "User", with: @activity.user_id
    click_on "Update Activity"

    assert_text "Activity was successfully updated"
    assert_selector "h1", text: "Activities"
  end

  test "destroying a Activity" do
    visit edit_activity_url(@activity)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Activity was successfully destroyed"
  end
end
