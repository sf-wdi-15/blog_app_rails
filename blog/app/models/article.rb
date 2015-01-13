class Article < ActiveRecord::Base
  attr_accessor :keywords
  @@alchemy_url ||= ENV["ALCHEMY_URL"]


  def make_request
    res = Typhoeus.get(@@alchemy_url, params: {
      apikey: ENV["076b4786e580dc41c326bab6535d6bc92371a94"],
      text: content,
      maxRetrieve: 10,
      outputMode: "json"
    })
    words = JSON.parse(res.body)["keywords"].map do |w|
      w['text']
    end
    @keywords = words.join(" | ")
  end

end