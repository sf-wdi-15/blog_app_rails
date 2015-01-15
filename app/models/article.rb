class Article < ActiveRecord::Base

  belongs_to :user

  def make_request
    request = Typhoeus::Request.new(
      "http://access.alchemyapi.com/calls/text/TextGetRankedKeywords",
      method: :get,
      params: { apikey: "fa2f5defffeb15bc53e8cc1d2f5e751e0e9c8c99",
                text: self.content,
                maxRetrieve: 10, 
                keywordExtractMode: "normal",
                outputMode: 'json',  },
      headers: { Accept: "text/html" }
    )

    request.run

    response = request.response
    keywordResults = JSON.parse(response.body)
    keyword = keywordResults["keywords"]
    puts keywordResults
    return keyword
  end   

end

