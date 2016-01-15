module ControllerMime
  def mimic_controller
    raise_misuse if misused? self.described_class
    mock_controller self.described_class
    draw_routes self.described_class
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
    method = first_action(controller).to_sym
    controller_path = controller.instance_method(method).source_location[0]
    controller do
      eval File.read(controller_path)
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

  def raise_misuse
    raise "ControllerMime is currently limited to use with ApplicationController only"
  end

  def misused?(controller)
    controller != ApplicationController
  end

  def first_action(controller)
    controller.action_methods.first
  end
end
