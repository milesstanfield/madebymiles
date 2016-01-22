require "spec_helper"

describe Role do
  it "has a title" do
    role = Role.new
    role.title = "Designer"
    expect(role.title).to eq "Designer"
  end

  it "has a unique title" do
    role = FactoryGirl.create :role, title: "designer"
    expect(Role.count).to eq 1
    expect {FactoryGirl.create :role, title: "designer"}.to raise_error(ActiveRecord::RecordInvalid)
  end
end