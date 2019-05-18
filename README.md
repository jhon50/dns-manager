# DNS Manager

This is a basic DNS manager

# Application Requirements

* Rails 5.2
* Ruby 2.4.6

# Prepare application

Install gems

`bundle install`

Create database

`rake db:create db:migrate`

# How To Execute

This application is using foreman as default to launch everything you might need.
Edit Procfile or use commands individually if you want.

run: 
`rails s`

# How To Test

run: 
`bundle exec rspec spec`
