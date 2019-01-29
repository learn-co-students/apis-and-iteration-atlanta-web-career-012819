def welcome
  puts ''' /$$      /$$           /$$                                             /$$
| $$  /$ | $$          | $$                                            | $$
| $$ /$$$| $$  /$$$$$$ | $$  /$$$$$$$  /$$$$$$  /$$$$$$/$$$$   /$$$$$$ | $$
| $$/$$ $$ $$ /$$__  $$| $$ /$$_____/ /$$__  $$| $$_  $$_  $$ /$$__  $$| $$
| $$$$_  $$$$| $$$$$$$$| $$| $$      | $$  \ $$| $$ \ $$ \ $$| $$$$$$$$|__/
| $$$/ \  $$$| $$_____/| $$| $$      | $$  | $$| $$ | $$ | $$| $$_____/
| $$/   \  $$|  $$$$$$$| $$|  $$$$$$$|  $$$$$$/| $$ | $$ | $$|  $$$$$$$ /$$
|__/     \__/ \_______/|__/ \_______/ \______/ |__/ |__/ |__/ \_______/|__/
Enter "help" for more information '''
end
def get_character_from_user()
  puts "Enter a character name:"
  input = gets.strip
end

def get_movie_from_user()
  puts "Enter a movie title:"
  input = gets.strip
end

def main_menu()
  puts "What do you want to lookup?:"
  input = gets.strip
  case input
  when 'help'
    print_help
  when 'character'
    get_character_from_user
  when 'movie'
    get_movie_from_user
  else
    puts "I don't understand, type 'help' for commands"
  end
  # use gets to capture the user's input. This method should return that input, downcased.
end

def print_help()
  puts '''You can use the following commands
  - help: print this message
  - character: lookup all the films a character appears in
  - movie: lookup additional information for a movie title'''
end
