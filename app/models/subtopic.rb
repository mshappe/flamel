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

class Subtopic < ActiveRecord::Base
  belongs_to :topic
  has_and_belongs_to_many :people
  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :topic, presence: true, allow_blank: false
end
