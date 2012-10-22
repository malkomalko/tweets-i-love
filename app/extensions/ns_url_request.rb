class NSURLRequest

  def parse_body
    query_string = NSString.stringWithUTF8String(self.HTTPBody.bytes)
    components = query_string.componentsSeparatedByString("&")

    components.reduce({}) do |memo, component|
      c = component.split("=")
      memo[c[0]] = c[1].safe("decode_string") || ""
      memo
    end
  end

  def parse_query
    query_string = self.URL.absoluteString[/\/\?(.+)/, 1] || ""
    components = query_string.componentsSeparatedByString("&")

    components.reduce({}) do |memo, component|
      c = component.split("=")
      memo[c[0]] = c[1].safe("decode_string") || ""
      memo
    end
  end

end
