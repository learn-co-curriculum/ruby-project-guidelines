require_relative '../config/environment'
require "tty-prompt"
prompt = TTY::Prompt.new

options = ["Create Tank", "Update Tank", "See Your Tank", "Delete Tank"]
prompt.select("What would you like to do?", options)

puts "HELLO WORLD"
