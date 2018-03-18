# Welcome controller
class WelcomeController < ApplicationController
  def index
    render json: { welcome: 'hi there' }
  end
end
