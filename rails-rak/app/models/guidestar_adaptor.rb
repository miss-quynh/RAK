class GuidestarSearchAdapter 

  include HTTParty

  base_uri "https://Sandboxdata.guidestar.org/v1_1/search?"
  format :json

  # headers Authorization: "Basic #{ENV['GUIDESTAR_SEARCH_API_KEY']}"

  @@auth = {:username => ENV['GUIDESTAR_USERNAME'], :password => ENV['GUIDESTAR_PASSWORD']}
  # default_params key: ENV['GUIDESTAR_SEARCH_API_KEY']

  def self.search_by_name(name) #returns top 10 charities matching a given string
    response = self.get('', query: { q: "organization_name:#{name}", basic_auth: @@auth } )["hits"]
  end 

  def self.verify_organization(ein) #verify using EIN
    response = self.get('', query: { q: "ein: #{ein}" }, basic_auth: @@auth )
    return parse_data(response)
  end

  private

  def self.parse_data(response)
    response["hits"]["ein"]
  end
end