require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  setup do
    @bad_topic = FactoryGirl.build :topic
    @good_topic = FactoryGirl.create :valid_topic
  end
  
  test "cannot create topic without name" do
    assert @bad_topic.invalid?
  end
  
  test "can create topic" do
    assert @good_topic.valid?
  end
  
  test "names must be unique" do
    @not_unique = Topic.create( { name: @good_topic.name } )
    assert @not_unique.invalid?
  end
  
  # test "the truth" do
  #   assert true
  # end
end
