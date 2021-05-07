require 'test_helper'

class MaterialsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
    @material = materials(:one)
  end

  test "should get index" do
    get :index, params: { project_id: @project }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { project_id: @project }
    assert_response :success
  end

  test "should create material" do
    assert_difference('Material.count') do
      post :create, params: { project_id: @project, material: @material.attributes }
    end

    assert_redirected_to project_material_path(@project, Material.last)
  end

  test "should show material" do
    get :show, params: { project_id: @project, id: @material }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { project_id: @project, id: @material }
    assert_response :success
  end

  test "should update material" do
    put :update, params: { project_id: @project, id: @material, material: @material.attributes }
    assert_redirected_to project_material_path(@project, Material.last)
  end

  test "should destroy material" do
    assert_difference('Material.count', -1) do
      delete :destroy, params: { project_id: @project, id: @material }
    end

    assert_redirected_to project_materials_path(@project)
  end
end
