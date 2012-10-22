module BubbleWrap
  module App

    module_function

    def caches_path
      NSSearchPathForDirectoriesInDomains(
        NSCachesDirectory, NSUserDomainMask, true)[0]
    end

    def config
      AppConfig::CONFIG[RUBYMOTION_ENV]
    end

    def current_controller
      RM::Assignments.current_controller
    end

    def current_view
      RM::Assignments.current_controller.view
    end

    def db
      App::Persistence
    end

    def main_queue
      Dispatch::Queue.main
    end

    def navbar
      App.window.subviews[1]
    end

    def nav_controller
      _window.rootViewController
    end

    def plist_key(key)
      NSBundle.mainBundle.objectForInfoDictionaryKey(key)
    end

    def queue
      Dispatch::Queue.concurrent(priority=:default)
    end

    def storyboard
      App.delegate.instance_variable_get("@storyboard")
    end

    def window
      _window.subviews[0]
    end

    def _window
      App.delegate.instance_variable_get("@window")
    end

  end

  module HTTP
    class Response

      attr_accessor :json

    end
  end
end
