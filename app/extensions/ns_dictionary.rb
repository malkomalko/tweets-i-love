class NSDictionary

  def symbolize_keys
    Hash[self.map {|k, v| [k.to_sym, v] }]
  end

end
