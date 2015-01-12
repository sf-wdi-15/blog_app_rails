class Article < ActiveRecord::Base
  attr_accessor :keywords
  @@alchemy_url ||= ENV["ALCHEMY_URL"]


  def get_keywords
    res = Typhoeus.get(@@alchemy_url, params: {
      apikey: ENV["ALCHEMY_APIKEY"],
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
