class Article < ActiveRecord::Base
	def make_request
		request = Typhoeus::Request.new(
  		"http://access.alchemyapi.com/calls/text/TextGetRankedKeywords",
  		method: :get,
  		params: { text: text, apikey: "076b4786e580dc41c326bab6535d6bc92371a94d", keywordExtractMode: "normal" },
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