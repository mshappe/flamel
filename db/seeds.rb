# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl_rails'

Topic.delete_all
Group.delete_all
Person.delete_all

FactoryGirl.create_list( :valid_topic, 5 ).each do |topic|
  FactoryGirl.create_list( :valid_subtopic, 42, topic: topic )
end

FactoryGirl.create_list( :valid_group, 12 ).each do |group|
  FactoryGirl.create_list( :valid_person, 18, group: group )
end