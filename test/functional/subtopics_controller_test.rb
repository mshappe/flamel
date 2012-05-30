require 'test_helper'

class SubtopicsControllerTest < ActionController::TestCase
  setup do
    @subtopic = FactoryGirl.build :valid_subtopic
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subtopics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subtopic" do
    assert_difference('Subtopic.count') do
      post :create, subtopic: { name: @subtopic.name, topic_id: @subtopic.topic_id }
    end

    assert_redirected_to subtopic_path(assigns(:subtopic))
  end

  test "should show subtopic" do
    @subtopic.save!
    get :show, id: @subtopic
    assert_response :success
  end

  test "should get edit" do
    @subtopic.save!
    get :edit, id: @subtopic
    assert_response :success
  end

  test "should update subtopic" do
    @subtopic.save!
    put :update, id: @subtopic, subtopic: { name: @subtopic.name, topic_id: @subtopic.topic_id }
    assert_redirected_to subtopic_path(assigns(:subtopic))
  end

  test "should destroy subtopic" do
    @subtopic.save!
    assert_difference('Subtopic.count', -1) do
      delete :destroy, id: @subtopic
    end

    assert_redirected_to subtopics_path
  end
end
