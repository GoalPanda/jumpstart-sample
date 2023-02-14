require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference("Project.count") do
      post projects_url, params: { project: { account_id: @project.account_id, budget: @project.budget, category: @project.category, classification: @project.classification, code: @project.code, delivery: @project.delivery, duration: @project.duration, end: @project.end, group: @project.group, identificator: @project.identificator, manager: @project.manager, name: @project.name, number: @project.number, percentage: @project.percentage, project_id: @project.project_id, routine: @project.routine, scale: @project.scale, sorting: @project.sorting, start: @project.start, status: @project.status, supervisor: @project.supervisor } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { account_id: @project.account_id, budget: @project.budget, category: @project.category, classification: @project.classification, code: @project.code, delivery: @project.delivery, duration: @project.duration, end: @project.end, group: @project.group, identificator: @project.identificator, manager: @project.manager, name: @project.name, number: @project.number, percentage: @project.percentage, project_id: @project.project_id, routine: @project.routine, scale: @project.scale, sorting: @project.sorting, start: @project.start, status: @project.status, supervisor: @project.supervisor } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference("Project.count", -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
