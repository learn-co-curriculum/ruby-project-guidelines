require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end


#namespace :db do
# namespace :test do
#   task :load => :environment do
#     Rake::Task["db:seed"].invoke
#   end
# end
# end
