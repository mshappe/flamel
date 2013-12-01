require 'test_helper'

class SubtopicsControllerTest < ActionController::TestCase
  setup do
    @topic = FactoryGirl.create :valid_topic
    @subtopic = FactoryGirl.build :valid_subtopic
  end

  test "should get new" do
    get :new, topic_id: @topic
    assert_response :success
  end

  test "should create subtopic" do
    assert_difference('Subtopic.count') do
      post :create, topic_id: @topic, subtopic: { name: @subtopic.name, topic_id: @subtopic.topic_id }
    end

    assert_redirected_to topic_subtopic_path(@topic, assigns(:subtopic))
  end

  test "should show subtopic" do
    @subtopic.save!
    get :show, topic_id: @topic, id: @subtopic
    assert_response :success
  end

  test "should get edit" do
    @subtopic.save!
    get :edit, topic_id: @topic, id: @subtopic
    assert_response :success
  end

  test "should update subtopic" do
    @subtopic.save!
    put :update, topic_id: @topic, id: @subtopic, subtopic: { name: @subtopic.name, topic_id: @subtopic.topic_id }
    assert_redirected_to topic_subtopic_path(@topic, assigns(:subtopic))
  end

  test "should destroy subtopic" do
    @subtopic.save!
    assert_difference('Subtopic.count', -1) do
      delete :destroy, topic_id: @topic, id: @subtopic
    end

    assert_redirected_to topic_path(@topic)
  end
end
