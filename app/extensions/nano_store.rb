module NanoStore
  class Model < NSFNanoObject

    extend RM::Functional
    include RM::Functional

    class << self

      def find_first_or_create(selector, params)
        model = find(selector)
        return model[0] unless model.empty?
        create(params)
      end

      def find_or_create(selector, params)
        model = find(selector)
        return model unless model.empty?
        create(params)
      end

      def one(selector)
        find(selector)[0]
      end

    end

    def pull(key = "", value = nil)
      bad_attributes = !key.is_a?(String) || value.nil?
      return nil if bad_attributes

      keys = key.split(".")
      return nil if keys.length == 0 || keys.length > 2

      key_not_array = self[keys[0]].nil? || !self[keys[0]].is_a?(Array)
      return nil if key_not_array

      case keys.length
      when 1 then self[keys[0]] = self[keys[0]].reject &eql(value)
      when 2 then self[keys[0]] = self[keys[0]].reject &eql(keys[1], value)
      end

      save
    end

    def push(key = "", value = nil)
      bad_attributes = !key.is_a?(String) || value.nil?
      key_not_array = !self[key].nil? && !self[key].is_a?(Array)
      return nil if bad_attributes || key_not_array

      array = self[key] ? self[key].clone : []
      array << value
      self[key] = array
      save
    end

    def set(key, value)
      bad_attributes = !key.is_a?(String) || value.nil?
      return nil if bad_attributes

      self[key] = value
      save
    end

  end
end
