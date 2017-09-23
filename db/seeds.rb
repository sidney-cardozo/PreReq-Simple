# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



puts "creating applicant users"

User.destroy_all

(5.times).each do
User.create!({
  email: Faker::Internet.email,
  password: Faker::Internet.password(8),
  role: 0
  })
end

(5.times).each do
User.create!({
  email: Faker::Internet.email,
  password: Faker::Internet.password(8),
  role: 1
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

User.create!({
  email: "applicant@applicant.com",
  password: "password",
  role: 0
})

User.where({email: "applicant@applicant.com"}).each do |user|
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
  email: "admin@admin.com",
  password: "password",
  role: 2
})

puts "creating Students"
Student.destroy_all

(5.times).each do
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

puts "creating Employers"

Employer.destroy_all
User.where(role: 1).each do |user|
  Employer.create!({
    name: Faker::Company.name,
    user_id: user.id,
    description: Faker::Company.bs
  })
end

User.create!({
  email: "employer@employer.com",
  password: "password",
  role: 1
})

User.where({email: "employer@employer.com"}).each do |user|
  Employer.create!({
    name: Faker::Company.name,
    user_id: user.id,
    description: Faker::Company.bs
  })
end

puts "Employers created"

puts "creating Jobs"
Job.destroy_all
Employer.all.each do |employer|
  (5.times).each do
    Job.create!({
      employer_id: employer.id,
      position: Faker::Company.profession,
      description: Faker::Hipster.paragraph(3),
      requirements: Faker::Hipster.paragraph(3),
      job_type: Faker::Company.profession,
      apply_info: Faker::Hipster.paragraph(2)
    })
  end
end

puts "jobs created"

