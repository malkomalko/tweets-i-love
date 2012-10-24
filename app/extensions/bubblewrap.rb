module BubbleWrap
  module App

    module_function

    def caches_path
      NSSearchPathForDirectoriesInDomains(
        NSCachesDirectory, NSUserDomainMask, true)[0]
    end

    def config
      App::Config::CONFIG[RUBYMOTION_ENV]
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
      App.current_controller.navigationController.navigationBar
    end

    def nav_controller
      App.current_controller.navigationController
    end

    def playground
      App::Playground
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
