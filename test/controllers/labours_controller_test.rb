require 'test_helper'

class LaboursControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
    @labour = labours(:one)
  end

  test "should get index" do
    get :index, params: { project_id: @project }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { project_id: @project }
    assert_response :success
  end

  test "should create labour" do
    assert_difference('Labour.count') do
      post :create, params: { project_id: @project, labour: @labour.attributes }
    end

    assert_redirected_to project_labour_path(@project, Labour.last)
  end

  test "should show labour" do
    get :show, params: { project_id: @project, id: @labour }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { project_id: @project, id: @labour }
    assert_response :success
  end

  test "should update labour" do
    put :update, params: { project_id: @project, id: @labour, labour: @labour.attributes }
    assert_redirected_to project_labour_path(@project, Labour.last)
  end

  test "should destroy labour" do
    assert_difference('Labour.count', -1) do
      delete :destroy, params: { project_id: @project, id: @labour }
    end

    assert_redirected_to project_labours_path(@project)
  end
end
