class Blog < ActiveRecord::Base
def make_request
request = Typhoeus::Request.new(
  "http://access.alchemyapi.com/calls/text/TextGetRankedKeywords",
  method: :get,
  params: { text: content, apikey: keywordExtractMode: "normal" },
  headers: { Accept: "text/html" }
)

request.run

response = request.response
puts response.code
response.total_time
response.headers
response.body

parseResponse = JSON.parse(response)
puts parseResponse

end 


end




