module ResponsiveTestHelper
  def resize_window(size_name_or_width, height = nil)
    if size_name_or_width.class == Symbol
      case size_name_or_width
      when :mobile
        resize 320, 480
      when :tablet
        resize 960, 640
      when :desktop
        resize 1100, 800
      end
    else
      resize size_name_or_width, height
    end
  end

  private

  def resize(width, height)
    page.driver.browser.manage.window.resize_to(width, height)
  end
end
