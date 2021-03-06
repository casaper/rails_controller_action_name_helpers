$LOAD_PATH.push File.expand_path('lib', __dir__)
$LOAD_PATH.push File.expand_path('app', __dir__)

# Maintain your gem's version:
require 'rails_controller_action_name_helpers/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = 'rails_controller_action_name_helpers'
  s.version = RailsControllerActionNameHelpers::VERSION
  s.authors = ['Kaspar Vollenweider']
  s.email = ['vok@panter.ch']
  s.homepage = 'https://github.com/casaper/rails_controller_action_name_helpers'
  s.summary = 'Rails Controller Action Name Helpers'
  s.description = 'Simple helpers to have more readable checks for current '\
                       'controller name or action name in rails views.'
  s.license = 'MIT'
  s.cert_chain = ['certs/casaper.pem']
  if $PROGRAM_NAME =~ /gem\z/
    s.signing_key = File.expand_path('~/.ssh/gem-private_key.pem')
  end

  s.files = Dir['lib/**/*', 'app/helpers/controller_acttion_name_helpers.rb', 'LICENSE', 'Rakefile', 'README.md']

  s.required_ruby_version = '>= 2.4.0'
  s.add_dependency 'rails', '> 4.0.0'
end
