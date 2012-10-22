module RM
  module AppAssignments

    def setup_app_assignments(controller)
      RM::Assignments.current_controller = controller
    end

  end

  class Assignments

    class << self
      attr_accessor :current_controller
    end

  end
end
