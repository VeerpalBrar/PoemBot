require 'net/http'
require 'json'

conn = Net::HTTP.new('avaprojects-avacode.c9users.io', 8080)
# response = conn.get('/api/v1/poems.json')
# puts JSON.parse(response.body)

data = {
    poem: {
    title: "From api", 
    author: "ApiBot",
    content: "I have come from the webs"
}
}

# response = conn.post("/api/v1/poems", poem.to_json) 
req = Net::HTTP::Post.new("/api/v1/poems.json", {'Content-Type' =>'application/json'})
req.body = data.to_json
puts req.body
response = conn.request(req)
puts JSON.parse(response.body)
