require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  #Enables logging in Pry console whenever ActiveRecord writes SQL for us
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  #Open Pry console, similar to binding.pry.
  Pry.start
end