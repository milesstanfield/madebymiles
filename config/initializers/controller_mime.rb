module ControllerMime
  def mimic_controller
    controller = self.described_class
    unless controller == ApplicationController
      raise "ControllerMime is currently limited to use with ApplicationController only"
    end
    action = controller.action_methods.first
    controller_file = controller.instance_method(action.to_sym).source_location.first

    controller do
      eval File.read(controller_file)
    end

    before do
      actions = self.described_class.action_methods
      routes.draw do
        eval dynamic_routes(actions).join(" ")
      end
    end

    private

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

  end
end
