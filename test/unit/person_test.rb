# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  sca_name   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  should have_and_belong_to_many :subtopics
  should belong_to :group
  should validate_presence_of :sca_name
  should validate_uniqueness_of :sca_name
end
