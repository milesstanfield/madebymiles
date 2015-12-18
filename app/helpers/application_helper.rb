module ApplicationHelper

  def name_of_controller(c = controller)
    c.view_context.controller_name
  end

  def name_of_action(c = controller)
    c.view_context.action_name
  end

end
