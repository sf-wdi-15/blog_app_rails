class Article < ActiveRecord::Base
def make_request
request = Typhoeus::Request.new(
  "http://access.alchemyapi.com/calls/text/TextGetRankedKeywords",
  method: :get,
  params: { text: text, apikey: "3332801afd31fe72ab705bc43d0bf699cc431c7b", keywordExtractMode: "normal" },
  headers: { Accept: "text/html" }
)

request.run

response = request.response
response.code
response.total_time
response.headers
response.body
end  
end




