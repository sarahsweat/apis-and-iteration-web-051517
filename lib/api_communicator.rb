require 'rest-client'
require 'json'
require 'pry'



def get_character_movies_from_api(character)
  #make the web
  final_array = []
  all_characters = RestClient.get('http://www.swapi.co/api/people')
  character_hash = JSON.parse(all_characters)
  results = character_hash["results"]
  results.each do |x|
    if x["name"].downcase == character
      array_of_films = x["films"]
      array_of_films.each do |filmURL|
         film = RestClient.get(filmURL)
         final_array << JSON.parse(film)
      end
    end
  end
  final_array
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end


def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |elements|
    puts elements["title"]

  end

end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
