# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  has_many :people
  validates :name, presence: true, uniqueness: true
end
