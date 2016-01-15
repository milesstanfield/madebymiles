module ControllerMime
  def mimic_controller
    raise_misuse if misused?
    mock_controller this_controller
    draw_routes this_controller
  end

  private

  def draw_routes(controller)
    before do
      routes.draw do
        eval dynamic_routes(actions(controller)).join(" ")
      end
    end
  end

  def actions(controller)
    controller.action_methods
  end

  def mock_controller(controller)
    this_controller_path = controller.instance_method(first_action.to_sym).source_location.first
    controller do
      eval File.read(this_controller_path)
    end
  end

  def dynamic_routes(actions)
    actions.map do |action|
      %Q[
        get "/anonymous/#{action}"
        post "/anonymous/#{action}"
        patch "/anonymous/#{action}"
        put "/anonymous/#{action}"
        delete "/anonymous/#{action}"
      ]
    end
  end

  def this_controller
    @this_controller ||= self.described_class
  end

  def raise_misuse
    raise "ControllerMime is currently limited to use with ApplicationController only"
  end

  def misused?
    this_controller != ApplicationController
  end

  def first_action
    this_controller.action_methods.first
  end
end
