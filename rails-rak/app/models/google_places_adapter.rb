class GooglePlacesAdapter

  include HTTParty

  base_uri "https://maps.googleapis.com/maps/api/geocode/json"
  format :json

  default_params key: ENV['GOOGLE_PLACES_API_KEY']

  def self.convert_address(address)
    response = self.get('', query: { address: address } )
    return parse_data(response)
  end

  private

  def self.parse_data(response)
    response["results"][0]["geometry"]["location"]
  end
end