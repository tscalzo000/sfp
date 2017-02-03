class MapController < ApplicationController
  def index
    @result = request.location
    @url = 'https://maps.googleapis.com/maps/api/staticmap?'
    @url += 'center=Prudential+Center,Boston,MA'
    @url += '&zoom=13&size=600x300&maptype=roadmap'
    @url += '&markers=color:red%7Clabel:You location%7C' + @result.latitude.to_s + ',' + @result.longitude.to_s
    @url += '&key=' + ENV['GOOGLE_STATIC_KEY'].to_s
  end
end
