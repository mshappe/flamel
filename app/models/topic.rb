class Topic < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true, allow_blank: false, uniqueness: true
  has_many :subtopics, dependent: :destroy
end
