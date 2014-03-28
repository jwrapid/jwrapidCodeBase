#410 Project

## Running locally

Run the following commands to install:

* git clone this branch
* install ruby and rails (if your using windows [click here](http://railsinstaller.org/) to get setup)
* install [postgres](http://www.postgresql.org/) use same user/login as found in config/database.yml
* $ cd 410Project
* install dependencies/libraries using $ bundle install
* To set up database, simply run: $rake db:refresh
* For the rake commands, append with RAILS_ENV="production" for production mode
* Start rails server, $ rails server
* go to [http://localhost:3000](http://localhost:3000) to view the e-Store!
* you can login as an admin user using admin@example.com//foobar

## Troubleshooting 

Ubuntu 64 bit 

Postgress
* $ sudo apt-get install postgresql-9.1
* $ sudo apt-get install libpq-dev

Installing gem pg
* intall nodejs $ sudo apt-get install nodejs
* Change in GemFile to install gem 'pg'

Postgress Authentication
* Ubuntu by default: user postgres has no password
* sudo -u postgres psql
* ALTER USER postgres PASSWORD '<new_password>'; (change to match  config/database.yml)
