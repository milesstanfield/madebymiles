require "spec_helper"
include ApplicationHelper

describe TitleHelper, type: :helper do

  context ".title_tag" do
    it "returns title tag html for home page" do
      view_context = double(:view_context, controller_name: "home", action_name: "index")
      controller = double(:controller, view_context: view_context)
      expect(title_tag(controller)).to eq "<title>MadeByMiles</title>"
    end

    it "returns title tag html for posts page" do
      view_context = double(:view_context, controller_name: "posts", action_name: "tagged")
      controller = double(:controller, view_context: view_context)
      expect(title_tag(controller)).to eq "<title>MadeByMiles | tagged posts</title>"
    end

    it "returns title tag html for connect page" do
      view_context = double(:view_context, controller_name: "connect", action_name: "index")
      controller = double(:controller, view_context: view_context)
      expect(title_tag(controller)).to eq "<title>MadeByMiles | connect</title>"
    end
  end
end
