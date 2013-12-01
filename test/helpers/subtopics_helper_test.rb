require 'test_helper'

class SubtopicsHelperTest < ActionView::TestCase
  context 'A subtopic and a bunch of people' do
    setup do
      @subtopic = FactoryGirl.create :valid_subtopic
      @people = FactoryGirl.create_list :valid_person, 5
    end

    context 'Getting a list of possible assignees for a subtopic' do
      context 'when no one is assigned' do
        setup do
          @returned_people = available_people(@subtopic)
        end

        should 'return all people' do
          assert_equal @returned_people.count, @people.count
        end
      end

      context 'when some are assigned' do
        setup do
          @subtopic.people << @people.first
          @subtopic.people << @people[3]
          @returned_people = available_people(@subtopic)
        end

        should 'return only those not already assigned to this subtopic' do
          assert_equal @returned_people.count, @people.count - 2
        end
      end
    end

  end
end
