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

['Canton of Blachmere',
'Shire of Border Downs',
'Barony of Caer Anterth Mawr',
'Barony of Castel Rouge',
'Canton of Coille Stoirmeil',
'Shire of Coldedernhale',
'Shire of Darkstone',
'Shire of Dreibrucken',
'Shire of Falcon\'s Keep',
'Village of Heorot Denu',
'Village of Hvitskogar',
'Shire of Inner Sea',
'Barony of Jararvellir',
'Shire of Korsväg',
'Village of Lub Siochail',
'Shire of Mare Amethystenum',
'Shire of Midewinde',
'Shire of Mistig Waetru',
'Shire of Noiregarde',
'Canton of Nordleigh',
'Barony of Nordskogen',
'Village of Norwealdmere',
'Shire of Orlova Dolina',
'Village of Oubliette',
'Shire of Rivenwood Tower',
'Shire of Rockhaven',
'Shire of Rokeclif',
'Shire of Rudivale',
'Shire of Schattentor',
'Shire of Shattered Oak',
'Shire of Silfren Mere',
'SHire of Skerjastrond',
'Village of Stromfels',
'College of Svaty Sebesta',
'College of Tor Aerie',
'Shire of Trewint',
'Shire of Turm am dem See',
'Shire of Vilku Urvas',
'Barony of Windhaven',
'Shire of Wynandremer'].each do |g|
  Group.create name: g
end
