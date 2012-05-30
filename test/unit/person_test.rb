require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do
    @bad_person = FactoryGirl.build :person
    @dissociated_person = FactoryGirl.create :valid_person
    @good_person = FactoryGirl.create :associated_person
    @valid_subtopic = FactoryGirl.build :valid_subtopic
    @many_subtopics = []
    @many_people = []
    25.times do
      @many_subtopics << FactoryGirl.build( :valid_subtopic )
      @many_people << FactoryGirl.build( :valid_person )
    end
  end
  
  test "Cannot create unnamed person" do
    assert @bad_person.invalid?
  end
  
  test "Can create unassociated person" do
    assert @dissociated_person.valid?
  end
  
  test "Can associate subtopic later" do
    assert @dissociated_person.valid?
    @dissociated_person.subtopics << @valid_subtopic
    @dissociated_person.save
    assert @dissociated_person.valid?
    assert @valid_subtopic.valid?
  end
  
  test "Can create associated person" do
    assert @good_person.valid?
  end
  
  test "Person name must be unique" do
    @not_unique_person = Person.create( { sca_name: @good_person.sca_name, group_id: @good_person.group.id })
    assert @not_unique_person.invalid?
  end
      
  test "Can associate lots of subtopics with a person" do
    assert @good_person.valid?
    @good_person.subtopics << @many_subtopics
    @good_person.save
    assert @good_person.valid?
  end
  
  test "Can associate lots of people with a subtopic" do
    @many_people.each do |p| 
      assert p.valid?
    end
    
    @valid_subtopic.people << @many_people
    @valid_subtopic.save
    
    @many_people.each do |p| 
      assert p.valid?
    end
  end
  
  test "can associated lots of subtopics with lots of people" do
    @many_people.each do |p|
      assert p.valid?
    end
    
    @many_subtopics.each do |st|
      st.people << @many_people
      st.save
    end
    
    @many_people.each do |p|
      assert p.valid?
    end
  end
    
  # test "the truth" do
  #   assert true
  # end
end
