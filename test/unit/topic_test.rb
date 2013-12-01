# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  should have_many(:subtopics).dependent(:destroy)
  should validate_presence_of :name
  should validate_uniqueness_of :name
end
