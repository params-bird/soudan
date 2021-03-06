require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module Soudan
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.default_locale = :ja
    config.generators do |g|
      g.javascripts false
      g.helper false
      g.test_framework false
    end
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end