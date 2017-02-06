class MapController < ApplicationController
  def index
    @games = Game.where.not(lat: nil).where.not(lat: 0).where.not(lat: 1)
    @unlisted = Game.where(lat: nil)
    @unlisted += Game.where(lat: 1)
    @hash = Gmaps4rails.build_markers(@games) do |game, marker|
      marker.lat game.lat
      marker.lng game.lng
      marker.title game.name
      marker.infowindow "<h6><a href='/games/" + game.id.to_s + "'>" + game.name + "</a></h6><p>Address: " + game.location + "<br/>Description: " + game.description + "</p>"
    end
  end
end
