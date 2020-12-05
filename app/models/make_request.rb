require ‘uri’
require ‘net/http’
require ‘openssl’
require ‘json’
urls = [
    # URI(“https://api-football-v1.p.rapidapi.com/v2/topscorers/2”), #scorers in Premier League
    URI(“https://api-football-v1.p.rapidapi.com/v2/teams/league/2”), #teams in Premier League
    # URI(“https://api-football-v1.p.rapidapi.com/v2/leagueTable/2”), #team standings in Premier League
    URI(“https://api-football-v1.p.rapidapi.com/v2/fixtures/league/2?timezone=Europe%2FLondon”) #fixtures in Premier League
]
http = []
urls.each do |url|
    h = Net::HTTP.new(url.host, url.port)
    h.use_ssl = true
    h.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.push(h)
end
# http = [Net::HTTP.new(url1.host, url1.port), , Net::HTTP.new(url2.host, url2.port), Net::HTTP.new(url3.host, url3.port)]
# http.each do |h|
#     h.use_ssl = true
#     h.verify_mode = OpenSSL::SSL::VERIFY_NONE
# end
# http.use_ssl = true
#http.each {|h| h.verify_mode = OpenSSL::SSL::VERIFY_NONE}
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE
requests = []
urls.each do |url|
    r = Net::HTTP::Get.new(url)
    r[“x-rapidapi-key”] = ‘680adbf113mshff91628eec25474p194702jsnd1c76f97e364’
    r[“x-rapidapi-host”] = ‘api-football-v1.p.rapidapi.com’
    requests.push(r)
end
# request = [Net::HTTP::Get.new(url1), Net::HTTP::Get.new(url2), Net::HTTP::Get.new(url3)]
# requests.each {|r| r[“x-rapidapi-key”] = ‘680adbf113mshff91628eec25474p194702jsnd1c76f97e364’}
# requests.each {|r| r[“x-rapidapi-host”] = ‘api-football-v1.p.rapidapi.com’}
responses = []
count = 0
http.each do |h|
    responses.push(h.request(requests[count]))
    count += 1
end
# response1 = http[0].request(requests[0])
# response2 = http[1].request(requests[1])
# response3 = http[2].request(requests[2])
standings = JSON.parse(responses[0].read_body)
pp standings
# repeats = standings[‘api’][‘leagues’].map {|league| league[‘name’]}
# #pp repeats.uniq
# players = JSON.parse(responses[1].read_body)
# player_stats = players[‘api’][‘topscorers’].map {|player| [player[‘player_name’], player[‘goals’][‘total’], player[‘team_name’], player[‘nationality’]]}
# #pp player_stats
# # pp players
# # teams = JSON.parse(responses[2].read_body)
# # pp teams
# champs = JSON.parse(responses[3].read_body)
# #pp champs[‘api’][‘standings’][0].map {|team| [team[‘teamName’], team[‘description’] ]}
# national_teams = JSON.parse(responses[4].read_body)