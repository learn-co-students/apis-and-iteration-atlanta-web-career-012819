require 'rest-client'
require 'json'
require 'pry'

$url = "http://www.swapi.co/api/people/"


def get_character_movies_from_api(character_name)
  response_string = RestClient.get($url)
  response_hash = JSON.parse(response_string.body)
  character_hash = response_hash["results"].find do |char|
    character_name == char["name"]
  end
     character_hash["films"]
end

def print_movies(films)
  films.each do |film|
    response_string = RestClient.get(film)
    response_hash = JSON.parse(response_string.body)
    puts response_hash["title"]
  # puts $separator
  # some iteration magic and puts out the movies in a nice list
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  puts films
  print_movies(films)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
