require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

# disable the SQL debugging prompts
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
