require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.build :user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: FactoryGirl.attributes_for(:user)
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    @user.save!
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    @user.save!
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    @user.save!
    put :update, id: @user, user: { username: @user.username }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    @user.save!
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
