# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!({
  email: "allo",
  password: "alloha",
  role: 2
  })

puts "creating Students"
(10.times).each do
Student.create({
  name: Faker::Name.first_name,
  concentration: Faker::Hipster.word,
  industry: Faker::Hipster.sentence,
  resume_link: Faker::Internet.url,
  paired: false
  })
end
puts "students created"

