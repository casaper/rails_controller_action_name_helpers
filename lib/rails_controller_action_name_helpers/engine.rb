require 'rails'

module RailsControllerActionNameHelpers
  class Engine < Rails::Engine
    initializer 'rails_controller_action_name_helpers.helper' do
      ActionView::Base.include ControllerActionNameHelpers
    end
  end
end
