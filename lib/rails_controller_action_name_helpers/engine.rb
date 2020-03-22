require 'rails'
require File.expand_path('../../app/helpers/controller_acttion_name_helpers', __dir__)

module RailsControllerActionNameHelpers
  class Engine < Rails::Engine
    initializer 'rails_controller_action_name_helpers.helper' do
      ActionView::Base.include ControllerActionNameHelpers
    end
  end
end
