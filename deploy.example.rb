# Example file for the usage of the capistrano recipes
# You have to copy the deploy folder to your config dir for rails
# In this case i assume you only have one server, and running rails

# Add the following gems to your gemfile:
# 	- gem 'capistrano'
# 	- gem 'rvm-capistrano'	
# 	- gem 'turbo-sprockets-rails3' (only of you use rails >= 3.2.x)
# 	- gem 'unicorn' (Only if you use unicorn)

require "rvm/capistrano"
require "bundler/capistrano"

load 'config/deploy/main'
load 'config/deploy/recipes/nginx'	
load 'config/deploy/recipes/unicorn' 	# Only necassary if you use unicorn (please do :-) )
load 'config/deploy/recipes/assets' 	# Only necessary if you cant use turby-sprockets-rails3 gem

server "YOURSERVERADDRESS", :app, :web, :db, :primary => true # Can be IP or FQDN

set :application, 'YOUR-APPLICATION-NAME' # e.g. set :application, 'mysuperapp'
set :repository, "YOUR-REPO"							# e.g. set :application, 'git@github.com:jvanbaarsen/deploy.git'
set :deploy_to, "DEPLOYMENT_PATH"					# e.g. set :deploy_to, "/var/www/mysuperapp"

