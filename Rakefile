require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  #Enables logging in Pry console whenever ActiveRecord writes SQL for us
  #ActiveRecord::Base.logger = Logger.new(STDOUT)
  #Above outputs SQL 
  #Open Pry console, similar to binding.pry.
  Pry.start
end


task :start do 
Interface.welcome 
end
