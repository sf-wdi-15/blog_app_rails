class Blog < ActiveRecord::Base

 def make_request
 request = Typhoeus::Request.new(
  "http://access.alchemyapi.com/calls/text/TextGetRankedKeywords",
  method: :get,
  params: { text: text, apikey: "9d55d260d449135a0ee58d3f00fab49c150e4771", keywordExtractMode: "normal" },
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
