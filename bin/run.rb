require_relative '../config/environment'
require_relative '../bin/cli.rb'

#puts "HELLO WORLD"

cli = CLI.new
cli.main_menu()
