require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/letseat.db')
require_all 'lib'

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

