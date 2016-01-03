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

  def string_attributes_expectations(*attributes)
    attributes.each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", "some string")
      expect(record.send("#{attribute}")).to eq "some string"
    end
  end

  def numerical_attributes_expectations(*attributes)
    attributes.each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", 123)
      expect(record.send("#{attribute}")).to eq 123
    end
  end
end