require 'test_helper'

class PeopleControllerTest < ActionController::TestCase

  setup do
    @person = FactoryGirl.build :valid_person
    sign_in FactoryGirl.create :user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { sca_name: @person.sca_name, group_id: @person.group.id }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    @person.save!
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    @person.save!
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    @person.save!
    put :update, id: @person, person: { sca_name: @person.sca_name, group_id: @person.group.id }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    @person.save!
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
