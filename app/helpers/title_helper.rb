module TitleHelper

  def title_tag(c = controller)
    content_tag(:title, "MadeByMiles#{append_portion(c)}")
  end

  private

  def append_portion(controller)
    case name_of_controller(controller)
    when "home"
    when "posts"
      " | #{name_of_action(controller)} posts"
    else
      " | #{name_of_controller(controller)}"
    end
  end
end