
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
	url = "http://localhost:8153/go/api/agents/#{uuid}/disable"
	puts url
	#resp = Net::HTTP.get_response(URI.parse(url))
	#data = resp.body
	
	#result = JSON.parse(data)

	#return result
end

agents = agent_search()
print agents.is_a?(Array)
print "\n"

#agents.each do |agent|
#	agent.each_with_index do |val, index|
#		puts "Agent: #{index}"
#	end
#end


for index in 0 ... agents.size
  # print agents[index].is_a?(Hash)
  disable_agent(agents[index]["uuid"])
	#puts "agents[#{index}] = #{agents[index].inspect}"
end
