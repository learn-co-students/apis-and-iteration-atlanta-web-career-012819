#!/usr/bin/env ruby


require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
loop do
  puts "What do you want to lookup?:"
  input = gets.strip
  case input
  when 'help'
    print_help
  when 'character'
    character = get_character_from_user
    show_character_movies(character)
  when 'movie'
    movie = get_movie_from_user
    show_movie_details(movie)
  when 'exit'
    break
  else
    puts "I don't understand, type 'help' for commands"
  end
end
