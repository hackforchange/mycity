require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"
require 'mongoid/railtie'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Mycity
  class Application < Rails::Application
    config.generators do |g|
      g.orm             :mongoid
      g.template_engine :haml
    end

    config.encoding = "utf-8"
    config.filter_parameters += [:password]
  end
end
