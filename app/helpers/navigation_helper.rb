module NavigationHelper
  def nav_tabs(active_tab)
    [
      tab("home", "/", active_tab),
      tab("about", "/about", active_tab),
      tab("tutorials", "/posts/tutorials", active_tab),
      tab("portfolio", "/portfolio", active_tab),
      tab("blog", "/posts/blog", active_tab),
      tab("contact", "/contact", active_tab),
    ]
  end

  private

  def tab(text, path, active_tab)
    OpenStruct.new text: text, path: path, classes: tab_classes(text, active_tab)
  end

  def tab_classes(text, active_tab)
    tab_active?(text, active_tab) ? active_tab_classes : inactive_tab_classes
  end

  def tab_active?(text, active_tab)
    text == active_tab
  end

  def active_tab_classes
    "m-bold m-underline-white m-color-white m-medium l-relative"
  end

  def inactive_tab_classes
    "m-thin m-color-white m-medium l-relative"
  end
end
