require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  setup do
    @group = FactoryGirl.build :valid_group
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group" do
    assert_difference('Group.count') do
      post :create, group: { name: @group.name }
    end

    assert_redirected_to group_path(assigns(:group))
  end

  test "should show group" do
    @group.save!
    get :show, id: @group
    assert_response :success
  end

  test "should get edit" do
    @group.save!
    get :edit, id: @group
    assert_response :success
  end

  test "should update group" do
    @group.save!
    put :update, id: @group, group: { name: @group.name }
    assert_redirected_to group_path(assigns(:group))
  end

  test "should destroy group" do
    @group.save!
    assert_difference('Group.count', -1) do
      delete :destroy, id: @group
    end

    assert_redirected_to groups_path
  end
end
