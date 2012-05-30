require 'test_helper'

class SubtopicTest < ActiveSupport::TestCase
  setup do
    @bad_subtopic = FactoryGirl.build :subtopic
    @named_subtopic = FactoryGirl.build :named_subtopic
    @good_subtopic = FactoryGirl.create :valid_subtopic
  end
  
  test "cannot create subtopic without name and topic" do
    assert @bad_subtopic.invalid?
  end
  
  test "cannot create subtopic without topic" do
    assert @named_subtopic.invalid?
  end
  
  test "can create subtopic" do
    assert @good_subtopic.valid?
  end
  
  test "subtopic names must be unique" do
    @not_unique_subtopic = Subtopic.create( { name: @good_subtopic.name, topic_id: @good_subtopic.topic.id } )
    p @good_subtopic
    p @not_unique_subtopic
    assert @not_unique_subtopic.invalid?
  end
end
