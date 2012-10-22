module RM
  module Functional

    def prop(key)
      ->(obj) { obj[key] }
    end

    def eql(key, val = nil)
      val ? ->(obj) { obj[key] == val } : ->(obj) { obj == key }
    end

  end
end
