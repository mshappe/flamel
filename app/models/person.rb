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

class Person < ActiveRecord::Base
  has_and_belongs_to_many :subtopics
  belongs_to :group
  validates :sca_name, presence: true, allow_blank: false, uniqueness: true
end
