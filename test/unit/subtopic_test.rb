# == Schema Information
#
# Table name: subtopics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SubtopicTest < ActiveSupport::TestCase
  should belong_to :topic
  should have_and_belong_to_many :people
  should validate_presence_of :name
  should validate_uniqueness_of :name
  should validate_presence_of :topic
end
