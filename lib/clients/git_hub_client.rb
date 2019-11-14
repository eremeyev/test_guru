class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '000fe8d6d7d1d7c597fa89a8b65af53218934ec8'  
  attr_accessor :http_client
  
  def initialize
    @http_client = setup_http_client
  end
  
  def create_gist(params)
    @http_client.create_gist(params)
  rescue
    refresh_token
  end
  
  private
  
  def refresh_token
    
  end
  
  def setup_http_client
    Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end
end
