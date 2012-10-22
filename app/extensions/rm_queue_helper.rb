module RM
  module QueueHelper

    module_function

    def async_image_from_url(url, &block)
      App.queue.async {
        image_data = NSData.from_url(url)
        App.main_queue.async { block[image_data] }
      }
    end

  end
end
