class NSURL

  def append_query_string(query_string)
    return self if !query_string

    url = "#{self.absoluteString}#{self.query ? '&' : '?'}#{query_string}"
    NSURL.URLWithString(url)
  end

end
