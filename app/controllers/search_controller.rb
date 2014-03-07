require 'net/http'
require 'json'

class SearchController < ApplicationController
  def index
    return if params[:search].class == NilClass || params[:search].length == 0

    url = "http://www.boardgamegeek.com/xmlapi2/search?query=" + params[:search].gsub(/\s+/, '+')
    response = Net::HTTP.get_response(URI.parse(url))
    @data = Hash.from_xml(response.body)["items"]["item"]

  end
end
