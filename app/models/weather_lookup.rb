require 'httparty'

class WeatherLookup
   attr_accessor :temperature, :icon, :condition

  def initialize
    weather_hash = fetch_weather
    assign_values(weather_hash)
  end 

  def fetch_weather
    HTTParty.get("http://api.wunderground.com/api/fd6a1efde539c07c/hourly/q/20001.xml")
  end

  def assign_values(weather_hash)
    hourly_forecast_response = weather_hash.parsed_response['response']['hourly_forecast']['forecast'].first
    self.temperature = hourly_forecast_response['temp']['english']
    self.icon = hourly_forecast_response['icon_url']
    self.condition = hourly_forecast_response['condition']
  end
end