module CapybaraHelpers
  def slug_date_portion1
    Time.now.strftime("%Y/%m/%d")
  end

  def slug_date_portion2
    (Time.now - 1.days).strftime("%Y/%m/%d")
  end

  def slug_date_portion3
    (Time.now + 1.days).strftime("%Y/%m/%d")
  end

  def one_selector_exists?(*selectors)
    selectors.any? {|selector| page.all(selector).count > 0 }
  end

  def page!
    save_and_open_page
  end
end