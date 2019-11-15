class GitHubClient
  attr_accessor :http_client
  
  def initialize
    @http_client = setup_http_client
  end
  
  def create_gist(params)
    @http_client.create_gist(params)
  end
  
  private
  
  def setup_http_client
    Octokit::Client.new(:access_token => ENV['GIT_HUB_ACCESS_TOKEN'])
  end
end
