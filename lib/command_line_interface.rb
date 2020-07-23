def welcome
  # puts out a welcome message here!
  puts "\nHello! Welcome to the Star Wars API!"
  puts "Type the name of a character to view a list of films that character appears in."
  puts "Alternatively, type 'film' to enter the name of a film, and view the list of all characters appearing in that film."
  puts "Type 'exit' at any time to quit the program."
end

def get_character_from_user
  print "\nplease enter a character name, or type 'film': "
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp.downcase
end
