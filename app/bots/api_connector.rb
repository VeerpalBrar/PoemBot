require 'net/http'
require 'json'
require 'rest_client'
module Bots
  class ApiConnector 

    def make_request
      token = create_auth_token
      req = Net::HTTP::Post.new("/api/v1/poems.json", {'Content-Type' =>'application/json', 
        'HTTP_AUTHORIZATION' => token})
      req.body = request_content
      response = connection.request(req)
      puts JSON.parse(response.body)
    end

    private  
    
    def connection
      conn = Net::HTTP.new('localhost', 3000)
    end

    def create_auth_token
      params = {
        email: 'email',
        password: 'password',
        client_id: 'client_id',
        client_secret: 'client_secret',
        grant_type: 'client_credentials'
      }
      begin
        reponse = RestClient.post("localhost:3000/oauth/token", params)
        JSON.parse(reponse)['access_token']
      rescue RestClient::BadRequest => e
        puts e.response
      end
    end

    def request_content
      data = {
        poem: {
          title: "From api", 
          author: "ApiBot",
          content: "I have come from the webs"
        }
      }.to_json
    end
  end
end