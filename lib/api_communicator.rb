require 'rest-client'
require 'json'
require 'pry'

$separator = "*" * 50

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  films_arr = []

  result = find_character(response_hash, character_name)
  # binding.pry

  if result
    films_arr = result["films"].collect do |film|
      JSON.parse(RestClient.get(film))
    end
  end
  # response_hash["results"].each do |result|
  #   # binding.pry
  #   if result["name"].downcase == character_name
  #     films_arr = result["films"].collect do |film|
  #       JSON.parse(RestClient.get(film))
  #     end
  #   end
  # end

  films_arr
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  # binding.pry
  puts "\n" + $separator
  if(!films.empty?)
    films.each do |film|
      puts "That character is in the film '#{film["title"]}'"
    end
  else
    puts "No films found matching that character."
  end
  puts $separator
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
def find_character(response_hash, character_name)
  result = response_hash["results"].find { |character| character["name"].downcase == character_name }

  if !result && response_hash["next"]
    response_hash = JSON.parse(RestClient.get(response_hash["next"]))
    find_character(response_hash, character_name)
    # binding.pry
  else
    result
  end
  # binding.pry
end

def find_film(title)
  films = JSON.parse(RestClient.get("http://www.swapi.co/api/films/"))

  result = films["results"].find do |film|
    film["title"].downcase == title
  end
  # binding.pry
end

def show_film_characters(title)
  result = find_film(title)

  if result
    # binding.pry
    characters = result["characters"].collect do |char|
      JSON.parse(RestClient.get(char))
    end
    # binding.pry
    puts "\n" + $separator
    characters.each { |name| puts "'#{name["name"]}' was in the movie '#{title}'."}
  else
    puts "\n" + $separator
    puts "That film was not found."
  end
  puts $separator
end
