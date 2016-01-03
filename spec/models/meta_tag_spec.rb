require "spec_helper"

describe MetaTag do
  it "has string attributes" do
    string_attributes_expectations "type", "content", "type_value"
  end

  it "has numerical attributes" do
    numerical_attributes_expectations "page_id"
  end
end