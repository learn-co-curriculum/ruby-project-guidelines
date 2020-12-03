require 'bundler'
require 'pry'
Bundler.require
# require_all 'lib'
# require_all 'bin'
# require_relative '../lib/review.rb'



ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger = nil
