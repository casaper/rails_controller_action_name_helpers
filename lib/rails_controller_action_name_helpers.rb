require 'rails_controller_action_name_helpers/engine'

module RailsControllerActionNameHelpers
  def self.setup
    yield self
  end
end
