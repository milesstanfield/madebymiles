class AlexaController < ApplicationController
  def say_hello
    render json: { foo: 'bar' }
  end
end
