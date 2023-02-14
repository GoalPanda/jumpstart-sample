require "application_system_test_case"

class ComponentsTest < ApplicationSystemTestCase
  setup do
    @component = components(:one)
  end

  test "visiting the index" do
    visit components_url
    assert_selector "h1", text: "Components"
  end

  test "creating a Component" do
    visit components_url
    click_on "New Component"

    fill_in "Budget", with: @component.budget
    fill_in "Code", with: @component.code
    fill_in "Color", with: @component.color
    fill_in "Description", with: @component.description
    fill_in "Flag", with: @component.flag
    fill_in "Name", with: @component.name
    fill_in "Parent", with: @component.parent_id
    fill_in "Project", with: @component.project_id
    fill_in "Status", with: @component.status
    fill_in "User", with: @component.user_id
    click_on "Create Component"

    assert_text "Component was successfully created"
    assert_selector "h1", text: "Components"
  end

  test "updating a Component" do
    visit component_url(@component)
    click_on "Edit", match: :first

    fill_in "Budget", with: @component.budget
    fill_in "Code", with: @component.code
    fill_in "Color", with: @component.color
    fill_in "Description", with: @component.description
    fill_in "Flag", with: @component.flag
    fill_in "Name", with: @component.name
    fill_in "Parent", with: @component.parent_id
    fill_in "Project", with: @component.project_id
    fill_in "Status", with: @component.status
    fill_in "User", with: @component.user_id
    click_on "Update Component"

    assert_text "Component was successfully updated"
    assert_selector "h1", text: "Components"
  end

  test "destroying a Component" do
    visit edit_component_url(@component)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Component was successfully destroyed"
  end
end
