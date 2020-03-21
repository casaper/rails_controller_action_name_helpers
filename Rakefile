begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'yard'

YARD::Rake::YardocTask.new do |t|
  t.files = ['app/**/*.rb'] # optional
  t.options = ['README LICENSE'] # optional
end

Bundler::GemHelper.install_tasks
