require 'rest-client'
require 'json'
require 'pry'

def get_film_hashes(films)
  films.map do |film|
    response_string = RestClient.get(film)
    JSON.parse(response_string)
  end
end

def check_for_character(hash, character_name, films)
  hash["results"].each do |character|
    if character["name"].downcase == character_name
      films = character["films"]
    end
  end
  films
end

def next_page(hash)
  JSON.parse(RestClient.get(hash["next"]))
end


def get_character_movies_from_api(character_name)

  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  films = []

  while response_hash
    films = check_for_character(response_hash, character_name, films)
    films.empty? ? response_hash = next_page(response_hash) : break
  end

  get_film_hashes(films)

end

def print_movies(films)
  films.each_with_index do |film, index|
    puts "#{index + 1}. #{film["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  puts "\n"
  print_movies(films)
  puts "\n"
end

def get_year(date)
  date[0..3]
end

def get_characters(character_links)
  characters = []
  character_links.each do |character|
    response_string = RestClient.get(character)
    response_hash = JSON.parse(response_string)
    characters << response_hash["name"]
  end
  characters.join(", ")
end

def get_movie_info_from_api(movie)

  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)
  movie_info = {}

  response_hash["results"].each do |film|
    if film["title"].downcase == movie
      movie_info["Episode Number"] = film["episode_id"]
      movie_info["Director"] = film["director"]
      movie_info["Producer"] = film["producer"]
      movie_info["Release year"] = get_year(film["release_date"])
      movie_info["Main characters"] = get_characters(film["characters"])
    end
  end
  movie_info
end

def print_info(info)
  info.each do |k, v|
    puts "#{k}: #{v}"
  end
end

def show_movie_info(movie)
  info = get_movie_info_from_api(movie)
  puts "\n"
  print_info(info)
  puts "\n"
end
