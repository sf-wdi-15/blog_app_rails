require 'typhoeus'

class Article < ActiveRecord::Base
  def make_request
    request = Typhoeus::Request.new("http://access.alchemyapi.com/calls/text/TextGetRankedKeywords",
    method: :get,
    params: {apikey: "076b4786e580dc41c326bab6535d6bc92371a94",
        text: content,
        maxRetrieve: 10,
        keywordExtractMode: "normal",
        outputMode: "json" },
    headers: {Accept: "text/html"}
    )
    request.run
    response = request.response
    keywordResults = JSON.parse(response.body)
    keyword = keywordResults["keywords"]
    relevance = keywordResults["relevance"]
    puts keywordResults
    return keyword
  end

  belongs_to :user

  attr_accessor :keywords

  def author
    user ? user.email : "N/A"
  end

  def owned_by?(user)
    self.user_id == user.id
  end

end