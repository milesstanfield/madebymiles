module ControllerMime
  def mimic_controller
    controller = self.described_class
    unless controller == ApplicationController
      raise "ControllerMime is currently limited to use with ApplicationController"
    end
    action = controller.action_methods.first
    controller_file = controller.instance_method(action.to_sym).source_location.first

    controller do
      eval File.read(controller_file)
    end

    before do
      actions.each do |action|
        verbs.each_with_index do |verb, index|
          routes.draw { get "custom" => "anonymous#custom" }
        end
      end
    end

    private

    def verbs
      ["get", "post", "patch", "put", "delete"]
    end

    def actions
      self.described_class.action_methods
    end

  end
end
