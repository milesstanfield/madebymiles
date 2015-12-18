require "spec_helper"

describe ApplicationHelper do
  it ".name_of_controller" do
    view_context = double(:view_context, controller_name: "home")
    controller = double(:controller, view_context: view_context)
    expect(name_of_controller(controller)).to eq "home"
  end

  it ".name_of_action" do
    view_context = double(:view_context, action_name: "index")
    controller = double(:controller, view_context: view_context)
    expect(name_of_action(controller)).to eq "index"
  end
end