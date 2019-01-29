require 'rest-client'
require 'json'
require 'pry'
def dig_character_by_name(big_array, character_name)
  big_array.find {|hash| hash['name'] == character_name}
end

def swapi_request(url)
  response_string = RestClient.get(url)
  #FIX ME test for success here
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_hash = swapi_request('http://www.swapi.co/api/people/')
  character_hash = dig_character_by_name(response_hash['results'],character_name)

  character_hash['films'].map do |film_url|
    result = swapi_request(film_url)
    binding.pry
  end
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
