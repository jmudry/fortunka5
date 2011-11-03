# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Fortune.delete_all
Rate.delete_all
User.delete_all

require Rails.root.join('db', 'faker_pl')

Fortune.populate(100..200 ) do |fortune |
  fortune.body = Populator.sentences(1)
  fortune.author =  Faker::Name.first_name + " " + Faker::Name.last_name
end

10.times{

  u=User.new
  u.name = Faker::Name.first_name

  u.save
}

2000.times{
  r=Rate.new
  r.rater_id=rand(10)+1;
  r.rateable_id=rand(190)+1
  r.rateable_type = "Fortune"
  r.stars=rand(5)+1
  r.save
}

500.times{
   c=Comment.new
   c.fortune_id=rand(190)+1
   c.author= Faker::Name.first_name
   c.body = Populator.sentences(1)
  c.save
}
