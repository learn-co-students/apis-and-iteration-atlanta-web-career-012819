require 'rest-client'
require 'json'
require 'pry'
def dig_character(big_array, character_name)
  big_array.find {|hash| hash['name'] == character_name}
end
def dig_title(big_array, movie_title)
  big_array.find {|hash| hash['title'] == movie_title}
end
def swapi_request(url)
  response_string = RestClient.get(url)
  #FIX ME test for success here
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_hash = swapi_request('http://www.swapi.co/api/people/')
  character_hash = dig_character(response_hash['results'],character_name)

  character_hash['films'].map do |film_url|
    result = swapi_request(film_url)
  end
end

def get_movie_info(movie_title)
  response_hash = swapi_request('http://www.swapi.co/api/films/')
  dig_title(response_hash['results'], movie_title)
end

def print_details(movie_hash)
  puts """Title: #{movie_hash['title']}
Directed By: #{movie_hash['director']}
Produced By: #{movie_hash['producer']}
Released: #{movie_hash['release_date']}
Crawl:
  #{movie_hash['opening_crawl']}
--<>--<>--<>--<>--<>--<>--<>--<>--"""
end

def print_movies(films)
  films.each do |film|
    #binding.pry
    puts film['title']
    puts "Directed by: #{film['director']}, #{film['release_date']}"
    puts "--<>--<>--<>--<>--<>--<>--<>--<>--"
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  puts "#{character} appears in the following movies:"
  puts "<*><*><*><*><*><*><*><*><*><*><*><*><*><*><*><*><*><*><*><*>"
  print_movies(films)
end

def show_movie_details(movie_title)
  puts "Looking up detaisl for: #{movie_title}"
  puts "<*><*><*><*><*><*><*><*><*><*><*><*><*><*><*><*><*><*><*><*>"
  movie_hash = get_movie_info(movie_title)
  print_details(movie_hash)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
