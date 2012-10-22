class NSData

  def self.from_url(url)
    NSData.dataWithContentsOfURL(NSURL.URLWithString(url))
  end

end
