module CapybaraHelpers
  def slug_date_portion
    Time.now.strftime("%Y/%m/%d")
  end
end