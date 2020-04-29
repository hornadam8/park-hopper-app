require './config/environment'
require 'dotenv'
Dotenv.load('.env.local')



if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

use SessionsController
use ParksController
use UsersController
use TripsController
run ApplicationController
