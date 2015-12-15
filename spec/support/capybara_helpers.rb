module CapybaraHelpers
  def slug_date_portion
    Time.now.strftime("%Y/%m/%d")
  end

  def alternate_slug_date_portion
    (Time.now + 1.days).strftime("%Y/%m/%d")
  end

  def one_selector_exists?(*selectors)
    selectors.any? {|selector| page.all(selector).count > 0 }
  end
end