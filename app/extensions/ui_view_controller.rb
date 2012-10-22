class UIViewController

  include RM::AppAssignments

  attr_accessor :hide_back_button

  def viewWillAppear(animated)
    setup_app_assignments(self)

    if self.hide_back_button
      App.current_controller.navigationItem.hidesBackButton = true
    end
  end

end
