
require 'rubygems'
require 'json'
require 'net/http'

def agent_search
   url = "http://localhost:8153/go/api/agents"
#   url = "#{base_url}&query=#{URI.encode(query)}&results=#{results}&start=#{start}"
   resp = Net::HTTP.get_response(URI.parse(url))
   data = resp.body

   # we convert the returned JSON data to native Ruby
   # data structure - a hash
   result = JSON.parse(data)

   # if the hash has 'Error' as a key, we raise an error
   # if result.has_key? 'Error'
   #    raise "web service error"
   # end

   return result
end

def disable_agent(uuid)
	uri = URI.parse("http://localhost:8153")
	http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new("/go/api/agents/#{uuid}/disable")
  response = http.request(request)
  puts response
end

def delete_agent(uuid)
  uri = URI.parse("http://localhost:8153")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new("/go/api/agents/#{uuid}/delete")
  response = http.request(request)
  puts response
end

agents = agent_search()
print agents.is_a?(Array)
print "\n"

for index in 0 ... agents.size
  # print agents[index].is_a?(Hash)
  disable_agent(agents[index]["uuid"])
  delete_agent(agents[index]["uuid"])
end
