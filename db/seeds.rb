# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Fortune.delete_all
require Rails.root.join('db', 'faker_pl')

Fortune.populate(100..200 ) do |fortune |
  fortune.body = Populator.sentences(1)
  fortune.author =  Faker::Name.first_name + " " + Faker::Name.last_name
end
