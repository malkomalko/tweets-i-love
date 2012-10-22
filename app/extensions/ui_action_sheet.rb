class UIActionSheet

  def self.create(title, options = {}, &block)
    delegate = RM::UIActionSheetDelegate.new
    delegate.callback = block
    delegate.send(:retain)

    args = [title, delegate, nil, nil]
    buttons = options[:buttons] || []

    buttons << "OK" if buttons.empty?

    delegate.buttons = buttons
    args.concat(buttons.map { |s| s.localized })
    args << nil

    sheet = self.alloc
    sheet.send(:"initWithTitle:delegate:cancelButtonTitle:" +
      "destructiveButtonTitle:otherButtonTitles:", *args)
    sheet
  end

end

module RM
  class UIActionSheetDelegate

    attr_accessor :buttons
    attr_accessor :callback

    def actionSheet(actionSheet, didDismissWithButtonIndex:index)
      if callback.arity == 0
        callback.call
      else
        button = buttons[index]
        callback.call(button)
      end

      self.send(:autorelease)
    end

  end
end
