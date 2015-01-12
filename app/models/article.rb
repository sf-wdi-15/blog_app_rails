class Article < ActiveRecord::Base

  def make_request
    request = Typhoeus::Request.new(
      "http://access.alchemyapi.com/calls/text/TextGetRankedKeywords",
      method: :get,
      params: { apikey: "fa2f5defffeb15bc53e8cc1d2f5e751e0e9c8c99",
                text: content,
                maxRetrieve: 10, 
                keywordExtractMode: "normal",
                outputMode: 'json',  },
      headers: { Accept: "text/html" }
    )

    request.run

    response = request.response
    keywordResults = response.body
    puts keywordResults
    response.code
    response.total_time
    response.headers
    response.body
  end   

end

