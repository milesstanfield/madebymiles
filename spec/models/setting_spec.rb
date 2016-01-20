require "spec_helper"

describe Setting do
  it "has string/text attributes" do
    string_attributes_expectations "github", "stack_overflow", "facebook", "twitter", "email"
  end
end
