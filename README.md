# Prereq

App built for PreReq, a non-profit organization started by McGill MBA students, that seeks to help refugees enter the Montreal workforce in 2 main ways. First, PreReq invites employers to post job openings directed at the immigrant community on their site. Second, through their Buddy System, they match immigrants with MBA students who can help them find work through their connections and experience with the job search and application process. 

Suited for the needs of **3 types of users**: immigrants/applicants, employers, & admin. Employers can create an account for their company, edit their profile, & **post jobs**. Applicants can create an account, edit their profile, **search through job postings** and **bookmark their favorite ones**. Finally, admin can view the names and profiles of all immigrants and MBA students in the system, create profiles for new MBA students, create new pairs, & write "success stories" for pairs to be displayed on the site's homepage. 


**WORK IN PROGRESS** to be launched soon. 

Implemented with Ruby on Rails, Postgres, Bootstrap, & SASS.

## Screenshots

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Run `bin/rails s -b 0.0.0.0` to start the server


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x

