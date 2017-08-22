# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



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

User.where(role: 0).each do |user|
  Applicant.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    description: Faker::Hipster.paragraph(4),
    resume_link: Faker::Internet.email,
    user_id: user.id
  })
end

puts "applicant profiles created"
User.create!({
  email: "allo",
  password: "alloha",
  role: 2
})

puts "creating Students"
Student.destroy_all

(10.times).each do
Student.create({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  concentration: Faker::Hipster.word,
  industry: Faker::Hipster.sentence ,
  resume_link: Faker::Internet.url,
  email: Faker::Internet.free_email
  })
end

puts "students created"

