#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
input = gets.chomp
puts "\n"
if input == "i"
	movie = get_movie_from_user
	show_movie_info(movie)
elsif input == "m"
	character = get_character_from_user
	show_character_movies(character)
else
	puts "Error! Invalid command."
end
