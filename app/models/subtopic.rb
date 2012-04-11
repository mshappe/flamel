class Subtopic < ActiveRecord::Base
  belongs_to :topic
  has_and_belongs_to_many :people
  attr_accessible :name, :topic_id
  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :topic, presence: true, allow_blank: false
end
