class Person < ActiveRecord::Base
  has_and_belongs_to_many :subtopics
  belongs_to :group
  attr_accessible :sca_name, :group_id
  validates :sca_name, presence: true, allow_blank: false, uniqueness: true
end
