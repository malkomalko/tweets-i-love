class NSObject

  def safe(method_chain)
    methods = method_chain.split(".")
    obj = self

    methods.each do |method|
      obj = obj.respond_to?(method.to_sym) ? obj.send(method.to_sym) : nil
      return nil unless obj
    end

    obj
  end

end
