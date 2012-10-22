class NSString

  def decode_string
    stringByReplacingOccurrencesOfString("+", withString:" ").
      stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
  end

  def numbers
    chars_to_remove = NSCharacterSet.decimalDigitCharacterSet.invertedSet
    self.componentsSeparatedByCharactersInSet(
      chars_to_remove).componentsJoinedByString("")
  end

  def formatted_price(symbol = "")
    formatter = NSNumberFormatter.alloc.init
    formatter.formatterBehavior = NSNumberFormatterBehavior10_4
    formatter.numberStyle = NSNumberFormatterDecimalStyle
    formatter.maximumFractionDigits = 0
    formatter.currencySymbol = symbol
    "#{symbol}#{formatter.stringFromNumber(self.numbers.to_i)}"
  end

  def replace_in_range(range, string)
    new_string = NSMutableString.stringWithString(self)
    new_string.replaceCharactersInRange(range, withString:string)
  end

end
