require "httparty"

puts "Enter a city"
city = gets.chomp
puts "What state is that city in?"
state = gets.chomp

response = HTTParty.get("http://api.wunderground.com/api/023b537b0ab0fdea/conditions/q/#{state}/#{city}.json")
puts response
object = JSON.parse(response.body)["current_observation"]
time = object["local_time_rfc822"]
temp = object["temp_f"]

puts "The time is #{time} and the temperature is #{temp} degrees Fahrenheit in #{city}, #{state}."
