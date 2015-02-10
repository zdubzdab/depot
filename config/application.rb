require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Depot
  class Application < Rails::Application
    
    config.assets.initialize_on_precompile = false#to_load_image_on_herku
    config.serve_static_assets = true#to_js_on_herku
  end
end
