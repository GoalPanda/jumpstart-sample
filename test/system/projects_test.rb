require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Account", with: @project.account_id
    fill_in "Budget", with: @project.budget
    fill_in "Category", with: @project.category
    fill_in "Classification", with: @project.classification
    fill_in "Code", with: @project.code
    fill_in "Delivery", with: @project.delivery
    fill_in "Duration", with: @project.duration
    fill_in "End", with: @project.end
    fill_in "Group", with: @project.group
    fill_in "Identificator", with: @project.identificator
    fill_in "Manager", with: @project.manager
    fill_in "Name", with: @project.name
    fill_in "Number", with: @project.number
    fill_in "Percentage", with: @project.percentage
    fill_in "Project", with: @project.project_id
    fill_in "Routine", with: @project.routine
    fill_in "Scale", with: @project.scale
    fill_in "Sorting", with: @project.sorting
    fill_in "Start", with: @project.start
    fill_in "Status", with: @project.status
    fill_in "Supervisor", with: @project.supervisor
    click_on "Create Project"

    assert_text "Project was successfully created"
    assert_selector "h1", text: "Projects"
  end

  test "updating a Project" do
    visit project_url(@project)
    click_on "Edit", match: :first

    fill_in "Account", with: @project.account_id
    fill_in "Budget", with: @project.budget
    fill_in "Category", with: @project.category
    fill_in "Classification", with: @project.classification
    fill_in "Code", with: @project.code
    fill_in "Delivery", with: @project.delivery
    fill_in "Duration", with: @project.duration
    fill_in "End", with: @project.end
    fill_in "Group", with: @project.group
    fill_in "Identificator", with: @project.identificator
    fill_in "Manager", with: @project.manager
    fill_in "Name", with: @project.name
    fill_in "Number", with: @project.number
    fill_in "Percentage", with: @project.percentage
    fill_in "Project", with: @project.project_id
    fill_in "Routine", with: @project.routine
    fill_in "Scale", with: @project.scale
    fill_in "Sorting", with: @project.sorting
    fill_in "Start", with: @project.start
    fill_in "Status", with: @project.status
    fill_in "Supervisor", with: @project.supervisor
    click_on "Update Project"

    assert_text "Project was successfully updated"
    assert_selector "h1", text: "Projects"
  end

  test "destroying a Project" do
    visit edit_project_url(@project)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Project was successfully destroyed"
  end
end
