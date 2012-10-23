module API
  module Twitter

    module_function

    def search(term, &block)
      url = "http://search.twitter.com/search.json?q="
      url += "#{term}&rpp=25&include_entities=true"

      BW::HTTP.get(url) { |res| block[parse_json(res)] }
    end

    def parse_json(res)
      begin
        json = BW::JSON.parse(res.body.to_str)
        API::Tweet.from_json(json["results"])
      rescue BubbleWrap::JSON::ParserError
        { "msg" => "An unknown error has occurred" }
      end
    end

  end

  class Tweet

    attr_accessor :from_user, :text, :profile_image_url

    def initialize(opts = {})
      setValuesForKeysWithDictionary(opts) if opts.is_a?(Hash)
    end

    def setValue(value, forUndefinedKey:key); end

    def self.from_json(tweets)
      tweets.map { |tweet| new(tweet) }
    end

  end
end
