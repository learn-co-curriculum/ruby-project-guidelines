require 'rest-client' # let you actually make the requests to the URLs 
require 'json'

api_response_one = RestClient.get("https://swapi.dev/api/planets/1")
api_response_two = RestClient.get("https://swapi.dev/api/planets/2")
tatooine = JSON.parse(api_response_one)
alderaan = JSON.parse(api_response_two)

tatooine.each do |category|
    Planet.create(
        name: category["name"],
        population: category["population"]
        terrain: category["terrain"]
    )
end

alderaan.each do |category|
    Planet.create(
        name: category["name"],
        population: category["population"]
        terrain: category["terrain"]
    )
end



       