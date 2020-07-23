def welcome
  puts "
  ____ _____  _    ____       
 / ___|_   _|/ \\  |  _ \\      
 \\___ \\ | | / _ \\ | |_) |     
  ___) || |/ ___ \\|  _ <      
 |____/ |_/_/_  \\_\\_|_\\_\\___  
 \\ \\      / / \\  |  _ \\/ ___| 
  \\ \\ /\\ / / _ \\ | |_) \\___ \\ 
   \\ V  V / ___ \\|  _ < ___) |
  __\\_/\\_/_/___\\_\\_|_\\_\\____/ 
 |_ _| \\ | |  ___/ _ \        
  | ||  \\| | |_ | | | |       
  | || |\\  |  _|| |_| |       
 |___|_| \\_|_|   \\___/  (tm)

                              
"

	puts "Please enter a command:

	(i) Get basic information about a movie
	(m) Find out which movies a character appears in
	"
end

def get_character_from_user
  puts "Please enter a character name:
  "
  gets.chomp.downcase
end

def get_movie_from_user
	puts "Please enter a movie name:
	"
	gets.chomp.downcase
end
