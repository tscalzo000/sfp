class Httprequest
  def self.call(address)
    @address = address.gsub(/\s+/, '+')
    @client = HTTPClient.new
    @uri = 'https://maps.googleapis.com/maps/api/geocode/json'
    @key = ENV['GOOGLE_GEOCODING_KEY']
    @response = @client.get(@uri, :query => {:address => @address }, :header => { :key => @key, :"Accept" => 'application/json'}).body
    @parse = JSON.parse(@response)
    @lat = @parse['results'][0]['geometry']['location']['lat']
    @lng = @parse['results'][0]['geometry']['location']['lng']
    @status = @parse['status']
    return [@lat, @lng, @status]
  end
end
