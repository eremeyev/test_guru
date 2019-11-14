class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '76a5ac852ca230286861c5b7de7ae42f497ec117'  
  attr_accessor :http_client
  
  def initialize
    @http_client = setup_http_client
  end
  
  def create_gist(params)
    @http_client.create_gist(params)
  end
  
  private
  
  def setup_http_client
    Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end
end
