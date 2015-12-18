class Navigation
  class << self

    def footer_tabs
      tabs.unshift tab_struct("home", "/")
    end

    def tabs
      [
        tab_struct("about", "/about"),
        tab_struct("tutorials", "/posts/tutorials"),
        tab_struct("portfolio", "/portfolio"),
        tab_struct("blog", "/posts/blog"),
        tab_struct("connect", "/connect"),
      ]
    end

    def tab_classes(controller_name, tab_text)
      (controller_name == tab_text) ? active_tab_classes : inactive_tab_classes
    end

    private

    def tab_struct(text, path)
      OpenStruct.new(text: text, path: path)
    end

    def active_tab_classes
      "m-font-bold m-underline-white m-color-white m-font-medium l-relative"
    end

    def inactive_tab_classes
      "m-font-thin m-color-white m-font-medium l-relative"
    end

  end
end
