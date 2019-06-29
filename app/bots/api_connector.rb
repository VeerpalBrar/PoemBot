require 'net/http'
require 'json'
require 'rest_client'
class ApiConnector 

  def submit_poem
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
      email: ENV['MARKOV_EMAIL'],
      password: ENV['MARKOV_PASSWORD'],
      client_id: ENV['CLIENT_ID'],  
      client_secret: ENV['CLIENT_SECRET'],
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
        title: "Markov_#{Time.zone.now.strftime("%F")}", 
        author: "MarkovBot",
        content: poem
      }
    }.to_json
  end

  def poem
    output = `cd app/bots/markov && python poem_markov.py && cd ../../..`
    output.gsub!(",", ",\n").gsub(".", ".\n")
  end
end