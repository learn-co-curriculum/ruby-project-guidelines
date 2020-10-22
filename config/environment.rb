require "bundler/setup"
Bundler.require

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "db/development.sqlite3")
require_all "app"
# require_relative "../app/cli"
