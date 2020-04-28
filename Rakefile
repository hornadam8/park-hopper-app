ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


require 'dotenv'
Dotenv.load('.env')
require 'dotenv/tasks'

task :console do
  Pry.start
end
