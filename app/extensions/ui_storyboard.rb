class UIStoryboard

  def self.controller(storyboard_name, controller)
    named(storyboard_name).initController(controller)
  end

  def self.named(storyboard_name)
    storyboardWithName(storyboard_name, bundle:nil)
  end

  def self.push(name)
    controller = App.storyboard.initController(name)
    App.nav_controller << controller
  end

  def initController(controller)
    instantiateViewControllerWithIdentifier(controller)
  end

end
