class Blog < ActiveRecord::Base
  def make_request
    res = Typhoeus.get("http://www.alchemyapi.com/",{
    params:{
      q: @title
    }
    })
    res.body
  end
end




