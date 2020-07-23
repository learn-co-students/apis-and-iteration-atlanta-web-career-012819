#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
while true
  character = get_character_from_user
  break if character == "exit"

  if character == "film"
    print "please enter a film: "
    input = gets.chomp.downcase
    break if input == "exit"
    show_film_characters(input)
  else
    show_character_movies(character)
  end
end
