require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GuessrefHotwire
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.autoload_paths += %W(#{config.root}/lib/)
    config.load_defaults 7.0


    # don't uncomment this without making sure that the component 
    # generator is actually generating previews in the path set below
    #
    # when I set it to generate in the rspec folder via this path,
    # it failed to do so so I left the default path
    # config.view_component.preview_paths << "#{Rails.root}/spec/components/previews"


    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
