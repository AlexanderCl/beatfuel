class PagesController < ApplicationController
  def home
    t = "Blankenberge"
    response = HTTParty.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{t.split(',')[0]}&sensor=false&region=be")
    logger.debug("Tekst: #{t.split(',')[0]}")
    lat = response.parsed_response["results"].first["geometry"]["location"]["lat"]
    logger.debug("Tekst: #{lat}")
  end
end
