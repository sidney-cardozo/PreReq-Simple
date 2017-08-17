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

puts "creating applicant users"

User.destroy_all

(10.times).each do
User.create!({
  email: Faker::Internet.email,
  password: Faker::Internet.password(8),
  role: 0
  })
end

puts "applicant users created"

puts "creating applicant profiles"

Applicant.destroy_all

User.all.each do |user|
  Applicant.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    description: Faker::Hipster.paragraph(4),
    resume_link: Faker::Internet.email,
    user_id: user.id,
    paired: false
  })
end

puts "applicant profiles created"

puts "creating paired Students"

Student.destroy_all

(10.times).each do
Student.create({
  name: Faker::Name.first_name,
  concentration: Faker::Hipster.word,
  industry: Faker::Hipster.sentence,
  resume_link: Faker::Internet.url,
  paired: true
  })
end

puts "students created"

puts "creating paired Students"
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