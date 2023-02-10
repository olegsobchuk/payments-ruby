require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PaymentsRuby
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.active_record.schema_format = :sql
    config.active_job.queue_adapter = :sidekiq
    config.generators do |g|
      g.test_framework :rspec
      g.helper_specs false
      g.controller_specs true
      g.view_specs false
      g.routing_specs false
      g.request_specs false
      g.template_engine :slim
      g.stylesheets false
      g.helper false
    end
    config.active_record.dump_schema_after_migration = false
    config.autoload_paths += %W[#{config.root}/app/managers]
  end
end
