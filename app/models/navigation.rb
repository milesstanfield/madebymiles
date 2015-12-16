include ApplicationHelper

class Navigation
  class << self

    def tabs
      [
        tab_struct("about", "/about"),
        tab_struct("tutorials", "/posts/tutorials"),
        tab_struct("portfolio", "/porfolio"),
        tab_struct("blog", "/posts/blog"),
        tab_struct("connect", "/connect"),
      ]
    end

    def tab_classes(controller, nav_text)
      controller_name_matches_tab?(controller, nav_text) ? active_tab_classes : inactive_tab_classes
    end

    private

    def tab_struct(text, path)
      OpenStruct.new(text: text, path: path)
    end

    def controller_name_matches_tab?(controller, nav_text)
      name_of_controller(controller) == nav_text
    end

    def active_tab_classes
      "m-font-bold m-underline-white m-color-white m-font-medium l-nav-tab-text l-relative"
    end

    def inactive_tab_classes
      "m-font-thin m-color-white m-font-medium l-nav-tab-text l-relative"
    end

  end
end