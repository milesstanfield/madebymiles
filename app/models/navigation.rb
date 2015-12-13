class Navigation
  class << self

    def tabs
      [
        tab_struct("home", "/"),
        tab_struct("about", "/about"),
        tab_struct("blog", "/blog"),
        tab_struct("portfolio", "/porfolio"),
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
      controller.view_context.controller_name == nav_text
    end

    def active_tab_classes
      "m-font-bold m-underline-white m-color-white"
    end

    def inactive_tab_classes
      "m-font-thin m-color-white"
    end

  end
end