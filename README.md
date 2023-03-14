# README

***Database Setup
Steps to setup postgres dev & test databases
1. `brew install postgresql@13`
2. `brew services start postgresql@13`
3. `export PATH="/usr/local/opt/postgresql@13/bin:$PATH"`
4. `psql postgres`
	`create role bored_fam with createdb login password 'ChooseYourAdventureHere';`
	`exit`
5. Set your `PG_PASSWORD` environment variable
6. `bundle install`
7. `rake db:setup`

