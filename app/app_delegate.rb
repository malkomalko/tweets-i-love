include SugarCube::Adjust
include SugarCube::CoreGraphics

class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @storyboard = UIStoryboard.named("TweetsILove")

    setup_styles
    setup_database_storage
    setup_notifications

    @window.rootViewController = @storyboard.instantiateInitialViewController
    @window.makeKeyAndVisible
    true
  end

  def setup_styles
    AppStyles.apply_default_styles
  end

  def setup_database_storage
    path = App.documents_path
    NanoStore.shared_store = NanoStore.store(:file, path + "/tweets_i_love.db")
  end

  def setup_notifications
    # App.notification_center.post("event", { key: "value" })

    # App.notification_center.observe("event") do |notification|
    #   payload = notification.safe("object") || {}
    # end
  end

end
