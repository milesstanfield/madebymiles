module ApplicationHelper
  def title_tag(controller)
    append = title_tag_append_portion(name_of_controller(controller))
    content_tag(:title, "MadeByMiles#{append}")
  end

  def cloud_font_stylesheet
    stylesheet_link_tag(cloud_font_css_key) if cloud_font_css_key
  end

  def name_of_controller(controller)
    controller.view_context.controller_name
  end

  private

  def cloud_font_css_key
    ENV["CLOUD_TYPOGRAPHY_GOTHAM_CSS_KEY"]
  end

  def title_tag_append_portion(controller_name)
    case controller_name
    when "home"
    when "posts"
      " | #{controller.view_context.action_name} posts"
    else
      " | #{controller_name}"
    end
  end
end
