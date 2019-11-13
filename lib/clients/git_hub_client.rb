class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '9bde5dc7c16b9f1e260a6c0e76a47cb825d8d1d5'  
  
  def initialize
    @http_client = setup_http_client
  end
  
  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end
  
  private
  
  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
  
end
