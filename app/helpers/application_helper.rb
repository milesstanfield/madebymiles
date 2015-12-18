module ApplicationHelper

  def name_of_controller(c = controller)
    c.view_context.controller_name
  end

  def name_of_action(c = controller)
    c.view_context.action_name
  end

  def custom_blk_call(&blk)
    content_tag :div, class: "" do
      blk.call
      ""
    end
  end
end
