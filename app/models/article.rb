class Article < ActiveRecord::Base
	def make_request
		request = Typhoeus::Request.new(
		  "http://access.alchemyapi.com/calls/text/TextGetRankedKeywords",
		  method: :get,
		  params: { text: @article.content, apikey: "125279d7cc8a774d5af6d634b0d1344ee61f0f6b", keywordExtractMode: "normal" },
		  headers: { Accept: "text/html" }
		)

		response = request.response
		response.code
		response.total_time
		response.headers
		response.body

		redirect_to root_path
	end
end
