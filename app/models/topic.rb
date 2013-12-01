# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ActiveRecord::Base
  has_many :subtopics, dependent: :destroy
  validates :name, presence: true, allow_blank: false, uniqueness: true
end
