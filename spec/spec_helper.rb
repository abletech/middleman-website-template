require "middleman"
require 'rspec'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, { debug: false, # change this to true to troubleshoot
                                           window_size: [1000, 800], # this can affect dynamic layout
                                           inspector: false,
                                           js_errors: true
  })
end

Capybara.javascript_driver = :poltergeist

# Capybara.app = Middleman::Application.server.inst do
#   set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
#   set :environment, :development
#   set :show_exceptions, true
# end

Capybara.app = Middleman::Application.server {
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
}.to_rack_app
