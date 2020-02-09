require 'net/http'
require 'json'
require 'rest_client'
class ApiConnector 

  def submit_poem
    token = create_auth_token
    req = Net::HTTP::Post.new("/api/v1/poems.json", {'Content-Type' =>'application/json', 
      'Authorization' => "Bearer #{token}"})
    req.body = request_content
    response = connection.request(req)
    puts JSON.parse(response.body)
  end

  private  
  
  def connection
    conn = Rails.env.development? ? Net::HTTP.new('localhost', 3000) : Net::HTTP.new('poeticbot.herokuapp.com')
  end

  def create_auth_token
    params = {
      email: ENV['MARKOV_EMAIL'],
      password: ENV['MARKOV_PASSWORD'],
      client_id: ENV['CLIENT_ID'],  
      client_secret: ENV['CLIENT_SECRET'],
      grant_type: 'password'
    }
    begin
      response = RestClient.post(host.concat("/oauth/token"), params)
      puts JSON.parse(response)
      JSON.parse(response)['access_token']
    rescue RestClient::BadRequest => e
      puts "error"
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

  def host
    Rails.env.development? ? 'localhost:3000' : 'poeticbot.herokuapp.com' 
  end
end